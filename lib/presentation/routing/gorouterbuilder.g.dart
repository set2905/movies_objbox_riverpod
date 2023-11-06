// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gorouterbuilder.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $moviesPageRoute,
    ];

RouteBase get $moviesPageRoute => GoRouteData.$route(
      path: '/',
      factory: $MoviesPageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'movie/:id',
          factory: $MovieLandingPageRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'edit',
              factory: $MovieEditPageRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $MoviesPageRouteExtension on MoviesPageRoute {
  static MoviesPageRoute _fromState(GoRouterState state) => MoviesPageRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MovieLandingPageRouteExtension on MovieLandingPageRoute {
  static MovieLandingPageRoute _fromState(GoRouterState state) =>
      MovieLandingPageRoute(
        id: int.parse(state.pathParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/movie/${Uri.encodeComponent(id.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MovieEditPageRouteExtension on MovieEditPageRoute {
  static MovieEditPageRoute _fromState(GoRouterState state) =>
      MovieEditPageRoute(
        id: int.parse(state.pathParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/movie/${Uri.encodeComponent(id.toString())}/edit',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
