import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sionnach_ui_community/features/lesson/widget/connectivity_banner.dart';
import 'package:sionnach_ui_community/features/lesson/presentation/state/connectivity_state.dart';
import 'package:sionnach_ui_community/features/lesson/presentation/controller/connectivity_controller.dart';

import '../fakes/manual_connectivity_controller.dart';

const connectionTime = 100;

void main() {
  late ManualConnectivityController connectivityNotifier;
  late ProviderScope testScope;

  setUp(() {
    connectivityNotifier = ManualConnectivityController();

    testScope = ProviderScope(
      overrides: [
        // Replace the Controller with manual version
        connectivityControllerProvider.overrideWith(() => connectivityNotifier),
      ],
      child: const MaterialApp(home: Scaffold(body: ConnectivityBanner())),
    );
  });

  testWidgets('Banner hides online, shows offline/poor/invalid',
      (tester) async {
    await tester.pumpWidget(testScope);

    // Start online: nothing visible
    expect(find.textContaining('offline'), findsNothing);
    expect(find.textContaining('slow'), findsNothing);

    // Flip to offline
    connectivityNotifier.emit(NetQuality.offline);
    await tester.pumpAndSettle();
    expect(find.textContaining('offline'), findsOneWidget);

    // Flip to poor with specific latency greater than threshold (+1)
    connectivityNotifier.emit(NetQuality.poor, connectionTime + 1);
    await tester.pumpAndSettle();
    expect(find.textContaining('slow'), findsOneWidget);

    // Show invalid state
    connectivityNotifier.emit(NetQuality.invalid, -1);
    await tester.pumpAndSettle();
    expect(find.textContaining('unavailable'), findsOneWidget);

    // Back online: nothing visible again
    connectivityNotifier.emit(NetQuality.online);

    await tester.pumpAndSettle();
    expect(find.textContaining('offline'), findsNothing);
    expect(find.textContaining('slow'), findsNothing);
  });

  testWidgets('Clicking Dismiss hides banner; status change re-shows it',
      (tester) async {
    await tester.pumpWidget(testScope);

    // Show banner first (offline)
    connectivityNotifier.emit(NetQuality.offline);
    await tester.pumpAndSettle();
    expect(find.textContaining('offline'), findsOneWidget);

    // Tap the Dismiss button
    await tester.tap(find.textContaining('Dismiss'));
    await tester.pumpAndSettle();

    // Dismissed does not currently show
    expect(find.textContaining('offline'), findsNothing);

    // Status change resets local "dismissed" and shows again
    connectivityNotifier.emit(NetQuality.poor, 1200);
    await tester.pumpAndSettle();
    expect(find.textContaining('slow'), findsOneWidget);

    // And going back online hides it again
    connectivityNotifier.emit(NetQuality.online);
    await tester.pumpAndSettle();
    expect(find.textContaining('offline'), findsNothing);
    expect(find.textContaining('slow'), findsNothing);
  });
}
