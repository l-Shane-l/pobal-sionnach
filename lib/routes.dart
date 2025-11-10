import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'lesson_screen.dart';
import 'home_screen.dart';

part 'routes.g.dart';

/// A shell with a bottom nav (or side rail) that hosts multiple branches.
@TypedShellRoute<RootShellRoute>(
  routes: [
    TypedGoRoute<LessonsListRoute>(path: '/lessons'),
    TypedGoRoute<LessonRoute>(path: '/lesson/:id'),
  ],
)
class RootShellRoute extends ShellRouteData {
  const RootShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return Scaffold(
      body: navigator,
      bottomNavigationBar: _RootNavBar(state: state),
    );
  }
}

class _RootNavBar extends StatelessWidget {
  const _RootNavBar({required this.state});
  final GoRouterState state;

  int get _index {
    final loc = state.uri.toString();
    if (loc.startsWith('/lesson')) return 1;
    return 0; // /lessons
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: _index,
      onDestinationSelected: (i) {
        switch (i) {
          case 0:
            const LessonsListRoute().go(context);
            break;
          case 1:
            const LessonRoute(id: 'dummy_lesson').go(context);
            break;
        }
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.menu_book), label: 'Lessons'),
        NavigationDestination(icon: Icon(Icons.school), label: 'Lesson'),
      ],
    );
  }
}

/// /lessons (e.g., a list page)
class LessonsListRoute extends GoRouteData with $LessonsListRoute {
  const LessonsListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

/// /lesson/:id — typed path param
class LessonRoute extends GoRouteData with $LessonRoute {
  const LessonRoute({required this.id});
  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LessonScreen(plantedTreeId: id);
  }
}
