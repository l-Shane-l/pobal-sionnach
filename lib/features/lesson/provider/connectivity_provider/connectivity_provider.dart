// provider/connectivity_provider.dart
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'connection_state.dart';

class ConnectivityConstants {
  static const int poorThresholdMs = 1200;
  static const Duration pingInterval = Duration(seconds: 12);
}

final connectivityProvider =
    NotifierProvider<ConnectivityNotifier, ConnectionState>(
        () => ConnectivityNotifier());

/// Provider for connectivity status
/// Periodically pings to measure latency and determine connection quality
class ConnectivityNotifier extends Notifier<ConnectionState> {
  StreamSubscription? _connSub;
  Timer? _ping;

  final _kPingInterval = ConnectivityConstants.pingInterval;
  final _kPoorThresholdMs = ConnectivityConstants.poorThresholdMs;

  @override
  ConnectionState build() {
    ref.onDispose(() {
      /// Clean up subscriptions and timers
      _connSub?.cancel();
      _ping?.cancel();
    });
    _start();
    return const ConnectionState(status: NetQuality.online, lastLatencyMs: 0);
  }

  /// Start listening to connectivity changes and periodic checks
  /// Initial check is performed immediately
  /// Subsequent checks are performed every [_kPingInterval]
  /// On connectivity change, an immediate check is performed
  void _start() {
    _connSub = Connectivity().onConnectivityChanged.listen((_) => _checkNow());
    _checkNow();
    _ping = Timer.periodic(_kPingInterval, (_) => _checkNow());
  }

  /// Perform an immediate connectivity check
  /// Measures latency and updates state with [NetQuality] and [_kPoorThresholdMs]
  Future<void> _checkNow() async {
    final sw = Stopwatch()..start();
    final hasInternet = await InternetConnection().hasInternetAccess;
    sw.stop();
    final ms = sw.elapsedMilliseconds.toDouble();
    final status = !hasInternet
        ? NetQuality.offline
        : (ms > _kPoorThresholdMs ? NetQuality.poor : NetQuality.online);

    state = ConnectionState(
      status: status,
      lastLatencyMs: ms,
    );
  }
}
