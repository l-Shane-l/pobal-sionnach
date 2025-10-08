// test/connectivity_notifier_mocktail_test.dart
import 'dart:async';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mocktail/mocktail.dart';

import 'package:sionnach_ui_community/features/lesson/provider/connectivity_provider/connectivity_provider.dart';
import 'package:sionnach_ui_community/features/lesson/provider/connectivity_provider/connectivity_state.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class MockInternetConnection extends Mock implements InternetConnection {}

class MockConnectivity extends Mock implements Connectivity {}

class MockStopwatch extends Mock implements Stopwatch {}

/// Represents a simulated connection attempt
class TestConnection {
  final bool ok;
  final Duration delay;
  TestConnection({required this.ok, this.delay = Duration.zero});
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const longDelay = 100; // ms
  const pingDelay = 5; // seconds

  late ProviderContainer container;

  final InternetConnection mockConn = MockInternetConnection();
  final Connectivity mockConnectivity = MockConnectivity();

  late List<TestConnection> connections;
  late TestConnection currentConnection;
  late StreamController<List<ConnectivityResult>> connectivityCtrl;

  setUp(() {
    //Set default state before each test
    connections = [];
    currentConnection = TestConnection(ok: true, delay: Duration.zero);
    connectivityCtrl = StreamController<List<ConnectivityResult>>();

    // Create a new container for each test, with the connectivityProvider overridden
    container = ProviderContainer(overrides: [
      connectivityProvider.overrideWith(() => ConnectivityNotifier(
            mockConnectivity,
            mockConn,
            () {
              MockStopwatch newWatch = MockStopwatch();
              //Simlate the elapsed time based on the current connection's delay
              when(() => newWatch.elapsedMilliseconds)
                  .thenAnswer((_) => currentConnection.delay.inMilliseconds);

              return newWatch;
            },
            pingDelay,
            longDelay,
          )),
    ]);

    // Default mock behavior: return true (reachable), delay 0ms (fast)
    // Each call pops the next value from connections, or true if empty
    // Called on each container.read(connectivityProvider) or on connectivity change
    //
    // Note: we don't simulate or time real delay here;
    // instead we mock the Stopwatch response to control the reported latency
    // We could simulate delay by making this async and awaiting a Future.delayed
    // but Stopwatch does not respect fake time
    // So this is simpler to control, and is sufficient for these testing purposes
    when(() => mockConn.hasInternetAccess).thenAnswer((_) async {
      final next = connections.isNotEmpty
          ? connections.removeAt(0)
          : currentConnection; //TestConnection(ok: true, delay: Duration.zero); // fallback
      // await Future.delayed(next.delay);
      currentConnection = next;
      return next.ok;
    });

    // Simulate connectivity changes via a stream controller
    // Tests can add events to the controller to simulate connectivity changes
    // Default: no connectivity changes
    when(() => mockConnectivity.onConnectivityChanged)
        .thenAnswer((_) => connectivityCtrl.stream);
  });

  tearDown(() {
    // Reset test mocks so they don't leak between tests
    container.dispose();

    reset(mockConn);
    reset(mockConnectivity);
  });

  test('Stopwatch measures ~100ms realtime)', () async {
    final sw = Stopwatch()..start();
    await Future<void>.delayed(const Duration(milliseconds: 100));
    sw.stop();

    // Allow some slop for test environment timing
    expect(sw.elapsedMilliseconds, inInclusiveRange(50, 200));
  });

  test('initial state is reachable', () {
    fakeAsync((_) {
      // First probe
      final s = container.read(connectivityProvider);
      expect(s.status, NetQuality.online);
      expect(s.lastLatencyMs, 0);
      verify(() => mockConn.hasInternetAccess).called(1);
    });
  });

  test('poor vs online depends on latency when internet is reachable - online',
      () {
    fakeAsync((fa) {
      // Reachable -> should be ONLINE if lower than threshold

      // First probe; advance fake time
      container.read(connectivityProvider);
      fa.elapse(const Duration(milliseconds: longDelay));

      //check state with low latency
      final s = container.read(connectivityProvider);
      expect(s.status, NetQuality.online);
      expect(s.lastLatencyMs, lessThanOrEqualTo(longDelay));

      verify(() => mockConn.hasInternetAccess).called(1);
    });
  });

  test('poor vs online depends on latency when internet is reachable - poor',
      () {
    fakeAsync((fa) {
      // Reachable but slow -> should be POOR when latency above threshold
      // Set next connection to be slow
      connections = [
        TestConnection(
            ok: true, delay: const Duration(milliseconds: longDelay + 1))
      ];

      // First probe; advance fake time
      container.read(connectivityProvider);
      fa.elapse(const Duration(milliseconds: longDelay));

      //check state with high latency
      final s = container.read(connectivityProvider);

      expect(s.status, NetQuality.poor);
      expect(s.lastLatencyMs, greaterThanOrEqualTo(longDelay));
      verify(() => mockConn.hasInternetAccess).called(1);
    });
  });

  test('offline when internet check returns false (regardless of latency)', () {
    fakeAsync((fa) {
      // Simulate unreachable
      // Set next connection to be unreachable
      connections = [TestConnection(ok: false, delay: Duration.zero)];

      // Initial probe; advance fake time
      container.read(connectivityProvider);
      fa.elapse(const Duration(milliseconds: longDelay));

      //check unreachable state
      final s = container.read(connectivityProvider);
      expect(s.status, NetQuality.offline);
      verify(() => mockConn.hasInternetAccess).called(1);
    });
  });

  test('periodic ping updates state on schedule', () {
    fakeAsync((fa) {
      //set responses
      connections = [
        TestConnection(
            ok: true, delay: const Duration(milliseconds: longDelay - 1)),
        TestConnection(
            ok: true, delay: const Duration(milliseconds: longDelay + 1)),
        TestConnection(
            ok: false, delay: const Duration(milliseconds: longDelay + 2)),
        TestConnection(
            ok: true, delay: const Duration(milliseconds: longDelay - 2))
      ];

      //Initial probe
      container.read(connectivityProvider);
      fa.elapse(const Duration(milliseconds: 5));

      //check state (should be online, fast)
      final s0 = container.read(connectivityProvider);
      expect(s0.status, NetQuality.online);
      expect(s0.lastLatencyMs, longDelay - 1);

      //Advance to first periodic tick
      fa.elapse(const Duration(seconds: pingDelay));

      //check state again, should be poor now
      final s1 = container.read(connectivityProvider);
      expect(s1.status, NetQuality.poor);
      expect(s1.lastLatencyMs, longDelay + 1);

      //Advance to second periodic tick
      fa.elapse(const Duration(seconds: pingDelay));

      //check state again, should be offline now
      final s2 = container.read(connectivityProvider);
      expect(s2.status, NetQuality.offline);
      expect(s2.lastLatencyMs, longDelay + 2);

      //Advance to third periodic tick
      fa.elapse(const Duration(seconds: pingDelay));

      //check state again, should be back online
      final s3 = container.read(connectivityProvider);
      expect(s3.status, NetQuality.online);
      expect(s3.lastLatencyMs, longDelay - 2);

      verify(() => mockConn.hasInternetAccess).called(4);
    });
  });

  test('connectivity change triggers immediate probe', () async {
    fakeAsync((fa) {
      //1) online (fast). 2) offline (fast).
      connections = [
        TestConnection(ok: true, delay: Duration.zero),
        TestConnection(ok: false, delay: const Duration(milliseconds: 1))
      ];

      //Initial fast probe
      container.read(connectivityProvider);

      //Simulate connectivity changes via stream controller
      connectivityCtrl.add([ConnectivityResult.wifi]);
      fa.flushMicrotasks();

      final s = container.read(connectivityProvider);
      expect(s.status, NetQuality.offline);
      expect(s.lastLatencyMs, 1);

      verify(() => mockConn.hasInternetAccess).called(2);
    });
  });
}
