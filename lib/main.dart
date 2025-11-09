import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sionnach_ui_community/lesson_screen.dart';
import 'package:go_router/go_router.dart';
import 'home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sionnach UI Community',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/', //Home screen
  routes: [
    // selection home
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    // First lesson route
    GoRoute(
      path: '/lesson/:id',
      name: 'lesson',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return LessonScreen(plantedTreeId: id);
      },
    ),

    // Additional feature route
    GoRoute(
      path: '/lesson2/:id',
      name: 'lesson2',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return LessonScreen(plantedTreeId: id);
      },
    ),
  ],
);
