import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'routes.dart';

final appRouter = GoRouter(
  routes: $appRoutes,
  initialLocation: const LessonsListRoute().location,
  debugLogDiagnostics: kDebugMode,
);
