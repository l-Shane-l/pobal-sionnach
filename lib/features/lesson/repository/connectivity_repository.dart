import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:async';

part 'connectivity_repository.g.dart';

class ConnectivitySample {
  final bool hasInternet;
  final int latencyMs;
  const ConnectivitySample(
      {required this.hasInternet, required this.latencyMs});
}

abstract class BaseConnectivityRepository {
  Stream<List<ConnectivityResult>> connectionStream();
  Future<ConnectivitySample> sample();
}

class ConnectivityRepository implements BaseConnectivityRepository {
  ConnectivityRepository({
    Connectivity? connectivity,
    InternetConnection? internet,
    Stopwatch Function()? stopwatch,
  })  : _connectivity = connectivity ?? Connectivity(),
        _internet = internet ?? InternetConnection(),
        _stopwatch = stopwatch ?? Stopwatch.new;

  final Connectivity _connectivity;
  final InternetConnection _internet;
  final Stopwatch Function() _stopwatch;

  @override
  Stream<List<ConnectivityResult>> connectionStream() =>
      _connectivity.onConnectivityChanged;

  @override
  Future<ConnectivitySample> sample() async {
    final sw = _stopwatch()..start();
    final ok = await _internet.hasInternetAccess;
    sw.stop();
    return ConnectivitySample(
        hasInternet: ok, latencyMs: sw.elapsedMilliseconds);
  }
}

@Riverpod(keepAlive: true) //prevents lifecycle flickering
class ConnectivityRepo extends _$ConnectivityRepo {
  @override
  BaseConnectivityRepository build() {
    return ConnectivityRepository();
  }
}
