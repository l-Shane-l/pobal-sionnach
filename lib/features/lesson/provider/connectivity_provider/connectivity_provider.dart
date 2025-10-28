// provider/connectivity_provider.dart
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../presentation/state/connectivity_state.dart';

class ConnectivityConstants {
  static const int poorThresholdMs = 1200;
  static const int pingIntervalSeconds = 12;
}

abstract class BaseConnectivityNotifier<T>
    extends Notifier<ConnectivityState> {}

final connectivityProvider = NotifierProvider<
        BaseConnectivityNotifier<ConnectivityState>, ConnectivityState>(
    () => ConnectivityNotifier(
          Connectivity(),
          InternetConnection(),
          () => Stopwatch(),
          ConnectivityConstants.pingIntervalSeconds,
          ConnectivityConstants.poorThresholdMs,
        ));

/// Provider for connectivity status
/// Periodically pings to measure latency and determine connection quality
class ConnectivityNotifier extends BaseConnectivityNotifier<ConnectivityState> {
  final Connectivity _connectivity;
  final InternetConnection _internetConnection;
  //Allows for creation and disposal of a new Stopwatch on each check
  final Function() _stopwatch;
  final int _kPingIntervalSeconds;
  final int _kPoorThresholdMs;

  @override
  ConnectivityNotifier(this._connectivity, this._internetConnection,
      this._stopwatch, this._kPingIntervalSeconds, this._kPoorThresholdMs);

  StreamSubscription? _connSub;
  Timer? _ping;
  late final _kPingInterval = Duration(seconds: _kPingIntervalSeconds);

  @override
  ConnectivityState build() {
    ref.onDispose(() {
      /// Clean up subscriptions and timers
      _connSub?.cancel();
      _ping?.cancel();
    });
    _start();
    // Initial state is online with 0 latency, prevents flash of "offline" UI
    return const ConnectivityState(status: NetQuality.online, lastLatencyMs: 0);
  }

  /// Start listening to connectivity changes and periodic checks
  /// Initial check is performed immediately
  /// Subsequent checks are performed every [_kPingInterval]
  /// On connectivity change, an immediate check is performed
  void _start() {
    final stream = _connectivity.onConnectivityChanged;
    _connSub = stream.listen((_) => _checkNow());
    _checkNow();
    final interval = _kPingInterval;
    _ping = Timer.periodic(interval, (_) => _checkNow());
  }

  /// Perform an immediate connectivity check
  /// Measures latency and updates state with [NetQuality] and [_kPoorThresholdMs]
  Future<void> _checkNow() async {
    final sw = _stopwatch.call();
    sw.start();
    final hasInternet = await _internetConnection.hasInternetAccess;
    sw.stop();
    final ms = sw.elapsedMilliseconds.toDouble();
    final thresholdMs = _kPoorThresholdMs;
    final status = !hasInternet
        ? NetQuality.offline
        : (ms > thresholdMs ? NetQuality.poor : NetQuality.online);

    state = state.copyWith(
      status: status,
      lastLatencyMs: ms,
    );
  }
}
