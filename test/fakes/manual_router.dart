import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:sionnach_ui_community/routes.dart';

GoRouter buildTestRouter({String? initialLocation}) {
  return GoRouter(
    routes: $appRoutes,
    initialLocation: initialLocation ?? const LessonsListRoute().location,
    debugLogDiagnostics: kDebugMode,
  );
}
