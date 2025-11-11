// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $rootShellRoute,
    ];

RouteBase get $rootShellRoute => ShellRouteData.$route(
      factory: $RootShellRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/lessons',
          factory: $LessonsListRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/lesson/:id',
          factory: $LessonRoute._fromState,
        ),
      ],
    );

extension $RootShellRouteExtension on RootShellRoute {
  static RootShellRoute _fromState(GoRouterState state) =>
      const RootShellRoute();
}

mixin $LessonsListRoute on GoRouteData {
  static LessonsListRoute _fromState(GoRouterState state) =>
      const LessonsListRoute();

  @override
  String get location => GoRouteData.$location(
        '/lessons',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $LessonRoute on GoRouteData {
  static LessonRoute _fromState(GoRouterState state) => LessonRoute(
        id: state.pathParameters['id']!,
      );

  LessonRoute get _self => this as LessonRoute;

  @override
  String get location => GoRouteData.$location(
        '/lesson/${Uri.encodeComponent(_self.id)}',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
