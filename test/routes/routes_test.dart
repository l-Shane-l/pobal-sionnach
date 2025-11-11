import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../fakes/manual_router.dart';
import 'package:sionnach_ui_community/routes.dart';

Widget _appWith(GoRouter router) {
  return ProviderScope(
    overrides: const [],
    child: MaterialApp.router(routerConfig: router),
  );
}

const defaultMinWidth = 430.0;
const defaultMinHeight = 900.0;

void main() {
  setUp(() {});

  //Explicitly set size to avoid rendering overflow issues in current layout
  setSurfaceSize(WidgetTester tester, {double? height, double? width}) async {
    await tester.binding.setSurfaceSize(
        Size(width ?? defaultMinWidth, height ?? defaultMinHeight));
    addTearDown(() => tester.binding.setSurfaceSize(null));
  }

  testWidgets('initial route shows Lessons list', (tester) async {
    final router = buildTestRouter(
      initialLocation: const LessonsListRoute().location,
    );

    await tester.pumpWidget(_appWith(router));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('lesson_list_scaffold')), findsOneWidget);
    expect(find.text('Lessons'), findsOneWidget);
  });

  testWidgets('initial route shows Lessons', (tester) async {
    await setSurfaceSize(tester);

    final router = buildTestRouter(
      initialLocation: const LessonRoute(id: 'dummy_lesson1').location,
    );

    await tester.pumpWidget(_appWith(router));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('lesson_scaffold')), findsOneWidget);
    expect(find.text('Hello'), findsOneWidget);
  });

  testWidgets('deep link to /lesson/:id shows that lesson', (tester) async {
    await setSurfaceSize(tester);

    final loc = const LessonRoute(id: 'dummy_lesson1').location;
    final router = buildTestRouter(initialLocation: loc);

    await tester.pumpWidget(_appWith(router));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('lesson_scaffold')), findsOneWidget);
    expect(find.textContaining('Hello'), findsOneWidget);
  });

  testWidgets('navigate using .go() to another lesson', (tester) async {
    await setSurfaceSize(tester);

    final router = buildTestRouter(
      initialLocation: const LessonsListRoute().location,
    );

    await tester.pumpWidget(_appWith(router));
    await tester.pumpAndSettle();

    // Navigate programmatically using route
    router.go(const LessonRoute(id: 'abc123').location);

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('lesson_scaffold')), findsOneWidget);
    expect(find.textContaining('Hello'), findsOneWidget);
  });

  testWidgets('bottom nav taps switch between list and lesson', (tester) async {
    await setSurfaceSize(tester);

    final router = buildTestRouter(
      initialLocation: const LessonsListRoute().location,
    );

    await tester.pumpWidget(_appWith(router));
    await tester.pumpAndSettle();

    // On list
    expect(find.byKey(const Key('lesson_list_scaffold')), findsOneWidget);

    // Tap "Lesson 1" destination in NavigationBar
    await tester.tap(find.text('Lesson 1'));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('lesson_scaffold')), findsOneWidget);
    expect(find.textContaining('Hello'), findsOneWidget);
  });
}
