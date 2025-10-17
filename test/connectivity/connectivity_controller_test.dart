// test/connectivity_notifier_mocktail_test.dart
import 'dart:async';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mocktail/mocktail.dart';

import 'package:sionnach_ui_community/features/lesson/presentation/state/connectivity_state.dart';
import 'package:sionnach_ui_community/features/lesson/repository/connectivity_repository.dart';
import 'package:sionnach_ui_community/features/lesson/presentation/controller/connectivity_controller.dart';

class MockRepp extends Mock implements BaseConnectivityRepository {}

class FakeConnectivityRepo extends ConnectivityRepo {
  FakeConnectivityRepo(this.value);
  final BaseConnectivityRepository value;

  @override
  BaseConnectivityRepository build() => value;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const longDelay = 1200; // ms
  const pingDelay =
      12; // seconds -- TODO not aligned with real time ping schedule??

  final repo = MockRepp();

  late List<ConnectivitySample> connections;
  const ConnectivitySample defaultConnection =
      ConnectivitySample(hasInternet: true, latencyMs: 1);
  late StreamController<List<ConnectivityResult>> connectivityCtrl;

  late ProviderContainer container;
  late ProviderSubscription<ConnectivityState> status;

  setUp(() {
    //Set default state before each test
    connections = [
      const ConnectivitySample(hasInternet: false, latencyMs: 0),
      const ConnectivitySample(hasInternet: true, latencyMs: 2),
      const ConnectivitySample(hasInternet: true, latencyMs: longDelay + 1),
      const ConnectivitySample(hasInternet: false, latencyMs: 3),
      const ConnectivitySample(hasInternet: false, latencyMs: longDelay - 2),
      const ConnectivitySample(hasInternet: true, latencyMs: longDelay - 2)
    ];

    connectivityCtrl = StreamController<List<ConnectivityResult>>.broadcast();

    // Default mock behavior: return true (reachable), delay 1ms (fast)
    // Each call pops the next value from connections, or true if empty
    // Called on each scheduled ping and on connectivity change
    when(() => repo.sample()).thenAnswer((_) async {
      final next =
          connections.isNotEmpty ? connections.removeAt(0) : defaultConnection;
      // await Future.delayed(next.delay);
      return next;
    });

    // Simulate connectivity changes via a stream controller
    // Tests can add events to the controller to simulate connectivity changes
    // Default: no connectivity changes
    when(() => repo.connectionStream())
        .thenAnswer((_) => connectivityCtrl.stream);
  });

  //Helpers for initialization
  //Need to be initalized at different points
  //Depending on the test usage
  void buildContainer() {
    container = ProviderContainer(overrides: [
      connectivityRepoProvider.overrideWith(() => FakeConnectivityRepo(repo)),
    ]);

    //Keep the controller alive (autoDispose-safe)
    status = container.listen(
      connectivityControllerProvider,
      (prev, next) {},
      fireImmediately: true,
    );
  }

  void asyncBuildContainer(FakeAsync fa) {
    buildContainer();
    //lets controller build finish
    fa.flushMicrotasks();
  }

  tearDown(() {
    // Reset test mocks so they don't leak between tests
    container.dispose();

    reset(repo);
  });

  test('NetQuality ONLINE is properly defined', () {
    buildContainer();

    final s = container.read(connectivityControllerProvider.notifier);

    final t0 = connections[0];
    final s0 = s.defineStatus(t0);
    expect(t0.hasInternet, true);
    expect(t0.latencyMs, 2);
    expect(s0, NetQuality.online);
  });

  test('NetQuality POOR is properly defined', () {
    buildContainer();

    final s = container.read(connectivityControllerProvider.notifier);

    final t1 = connections[1];
    final s1 = s.defineStatus(t1);
    expect(t1.hasInternet, true);
    expect(t1.latencyMs, longDelay + 1);
    expect(s1, NetQuality.poor);
  });

  test('NetQuality OFFLINE is properly defined', () {
    buildContainer();

    final s = container.read(connectivityControllerProvider.notifier);

    final t2 = connections[2];
    final s2 = s.defineStatus(t2);
    expect(t2.hasInternet, false);
    expect(t2.latencyMs, 3);
    expect(s2, NetQuality.offline);
  });

  test('Controller state is reachable', () {
    fakeAsync((fa) {
      asyncBuildContainer(fa);
      // First probe
      final s = status.read();
      expect(s.status, NetQuality.offline);
      expect(s.lastLatencyMs, 0);
    });
  });

  test('periodic ping updates state on schedule', () {
    fakeAsync((fa) {
      asyncBuildContainer(fa);
      //first probe
      final s = status.read();
      expect(s.status, NetQuality.offline);
      expect(s.lastLatencyMs, 0);
      fa.elapse(const Duration(milliseconds: 5));
      fa.flushMicrotasks();

      //check state, no changes yet
      final s0 = status.read();
      expect(s0.status, s.status);
      expect(s0.lastLatencyMs, s0.lastLatencyMs);

      //Advance to first periodic tick
      fa.elapse(const Duration(seconds: pingDelay));
      fa.elapse(const Duration(milliseconds: longDelay));
      fa.flushMicrotasks();

      //check state again
      final s1 = status.read();
      expect(s1.status, NetQuality.online);
      expect(s1.lastLatencyMs, 2);

      //Advance to second periodic tick
      fa.elapse(const Duration(seconds: pingDelay));
      fa.flushMicrotasks();

      //check state again
      final s2 = status.read();
      expect(s2.status, NetQuality.poor);
      expect(s2.lastLatencyMs, longDelay + 1);

      //Advance to third periodic tick
      fa.elapse(const Duration(seconds: pingDelay));
      fa.flushMicrotasks();

      //check state again
      final s3 = status.read();
      expect(s3.status, NetQuality.offline);
      expect(s3.lastLatencyMs, 3);
    });
  });

  test('connectivity change triggers immediate probe', () {
    fakeAsync((fa) {
      asyncBuildContainer(fa);

      //Initial fast probe
      final s = status.read();
      expect(s.status, NetQuality.offline);
      expect(s.lastLatencyMs, 0);

      //Simulate connectivity changes via stream controller
      connectivityCtrl.add([ConnectivityResult.wifi]);
      fa.flushMicrotasks();

      final s1 = status.read();
      expect(s1.status, NetQuality.online);
      expect(s1.lastLatencyMs, 2);
    });
  });

  test('stop/start triggers immediate probe', () {
    fakeAsync((fa) {
      asyncBuildContainer(fa);

      //Initial fast probe
      final s = status.read();
      expect(s.status, NetQuality.offline);
      expect(s.lastLatencyMs, 0);

      //Simulate connectivity changes via stream controller
      final notifier = container.read(connectivityControllerProvider.notifier);
      notifier.stop();
      fa.flushMicrotasks();

      final s1 = status.read();
      expect(s1.status, NetQuality.invalid);
      expect(s1.lastLatencyMs, -1);

      notifier.start();
      fa.flushMicrotasks();

      final s2 = status.read();
      expect(s2.status, NetQuality.online);
      expect(s2.lastLatencyMs, 2);
    });
  });
}
