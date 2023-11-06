import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_objbox_riverpod/presentation/widgets/movieeditpage.dart';
import 'package:movies_objbox_riverpod/presentation/widgets/moviespage.dart';

import '../widgets/movielandingpage.dart';

part 'gorouterbuilder.g.dart';

@TypedGoRoute<MoviesPageRoute>(path: '/', routes: [
  TypedGoRoute<MovieLandingPageRoute>(path: 'movie/:id', routes: [
    TypedGoRoute<MovieEditPageRoute>(
      path: 'edit',
    )
  ])
])
@immutable
class MoviesPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MoviesPage();
  }
}

@immutable
class MovieLandingPageRoute extends GoRouteData {
  final int id;

  const MovieLandingPageRoute({
    required this.id,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MovieLandingPage(id);
  }
}

@immutable
class MovieEditPageRoute extends GoRouteData {
  final int id;

  const MovieEditPageRoute({
    required this.id,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MovieEditPage(id);
  }
}
