// feature/connectivity/connectivity_controller.dart
import 'dart:async';
import '../../repository/connectivity_repository.dart';
import '../state/connectivity_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_controller.g.dart';

class ConnectivityConstants {
  static const int poorThresholdMs = 1200;
  static const int pingIntervalSeconds = 12;
}

//Control Constants  [_kPingInterval] [_kPoorThreshold]
//Repository State Management [state]
//Functional Business Logic [_connSub] [_ping] [start()] [stop()] [checkSample()]
@riverpod
class ConnectivityController extends _$ConnectivityController {
  StreamSubscription? _connSub;
  Timer? _ping;

  final int _kPoorThresholdMs = ConnectivityConstants.poorThresholdMs;
  final _kPingInterval =
      const Duration(seconds: ConnectivityConstants.pingIntervalSeconds);

  late BaseConnectivityRepository _repo;

  @override
  ConnectivityState build() {
    ref.onDispose(() {
      _connSub?.cancel();
      _ping?.cancel();
    });

    _repo = ref.watch(connectivityRepoProvider);

    start();

    return ConnectivityState.initial();
  }

  void start() {
    checkSample();

    _connSub = _repo.connectionStream().listen((_) => checkSample());

    _ping = Timer.periodic(
      _kPingInterval,
      (_) => checkSample(),
    );
  }

  void stop() {
    _connSub?.cancel();
    _ping?.cancel();

    state = state.copyWith(status: NetQuality.invalid, lastLatencyMs: -1);
  }

  Future<void> checkSample() async {
    final r = _repo;
    final sample = await r.sample();

    final status = defineStatus(sample);

    final next = state.copyWith(
        status: status, lastLatencyMs: sample.latencyMs.toDouble());

    //
    if (next.status != state.status ||
        next.lastLatencyMs != state.lastLatencyMs) {
      state = next;
    }
  }

  NetQuality defineStatus(ConnectivitySample sample) {
    final status = !sample.hasInternet
        ? NetQuality.offline
        : (sample.latencyMs > _kPoorThresholdMs
            ? NetQuality.poor
            : NetQuality.online);

    return status;
  }
}
