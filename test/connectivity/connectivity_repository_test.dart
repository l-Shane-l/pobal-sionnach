import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:sionnach_ui_community/features/lesson/repository/connectivity_repository.dart';

class MockInternetConnection extends Mock implements InternetConnection {}

void main() {
  const longDelay = 100; // ms

  final InternetConnection mockConn = MockInternetConnection();
  late List<ConnectivitySample> connections;
  late ConnectivitySample currentConnection;

  late ConnectivityRepository repo;

  setUp(() {
    //Set default state before each test
    connections = [];
    currentConnection =
        const ConnectivitySample(hasInternet: true, latencyMs: 0);

    // Default mock behavior: return true (reachable), delay 0ms (fast)
    // Each call pops the next value from connections, or true if empty
    // Called on each sample()
    when(() => mockConn.hasInternetAccess).thenAnswer((_) async {
      final next =
          connections.isNotEmpty ? connections.removeAt(0) : currentConnection;
      await Future.delayed(Duration(milliseconds: next.latencyMs));
      currentConnection = next;
      return next.hasInternet;
    });

    repo = ConnectivityRepository(
      internet: mockConn,
    );
  });

  tearDown(() {
    // Reset test mocks so they don't leak between tests
    reset(mockConn);
  });

  test('Stopwatch measures ~100ms realtime)', () async {
    final sw = Stopwatch()..start();
    await Future<void>.delayed(const Duration(milliseconds: 100));
    sw.stop();

    // Allow some slop for test environment timing
    expect(sw.elapsedMilliseconds, inInclusiveRange(80, 120));
  });

  test('initial test state is reachable', () async {
    // First probe
    final s = await repo.sample();

    expect(s.hasInternet, true);
    expect(s.latencyMs, greaterThan(0));
  });

  test('poor vs online depends on latency when internet is reachable - online',
      () async {
    // Reachable -> should be ONLINE if lower than threshold
    connections = [const ConnectivitySample(hasInternet: true, latencyMs: 1)];

    //check state with low latency
    final s = await repo.sample();
    expect(s.hasInternet, true);
    expect(s.latencyMs, lessThanOrEqualTo(longDelay));
  });

  test('poor vs online depends on latency when internet is reachable - poor',
      () async {
    // Reachable but slow -> should be POOR when latency above threshold
    // Set next connection to be slow
    connections = [
      const ConnectivitySample(hasInternet: true, latencyMs: longDelay + 1)
    ];

    //check state with high latency
    final s = await repo.sample();

    expect(s.hasInternet, true);
    expect(s.latencyMs, greaterThanOrEqualTo(longDelay));
  });

  test('offline when internet check returns false (regardless of latency)',
      () async {
    // Simulate unreachable
    // Set next connection to be unreachable
    connections = [const ConnectivitySample(hasInternet: false, latencyMs: 0)];

    //check unreachable state
    final s = await repo.sample();
    expect(s.hasInternet, false);
  });
}
