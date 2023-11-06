import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_objbox_riverpod/presentation/widgets/moviespage.dart';

import '../widgets/movielandingpage.dart';

part 'gorouterbuilder.g.dart';

@TypedGoRoute<MoviesPageRoute>(
    path: '/',
    routes: [
      TypedGoRoute<MovieLandingPageRoute>(
        path: 'movie/:id',
      )
    ]
)
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

