import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_objbox_riverpod/persistence/objectboxdb.dart';
import 'package:movies_objbox_riverpod/presentation/controllers/movies/moviesnotifier.dart';
import 'package:movies_objbox_riverpod/presentation/controllers/movies/moviesstate.dart';
import 'package:movies_objbox_riverpod/repo/interfaces/moviesrepo.dart';
import 'package:movies_objbox_riverpod/repo/localmoviesrepo.dart';

import '../presentation/routenotifier.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<ObjectBoxDb>(() => ObjectBoxDb());

  locator.registerLazySingleton<MoviesRepo>(
      () => LocalMoviesRepo(objectBoxDb: locator()));

  locator.registerSingleton<StateNotifierProvider<MoviesNotifier, MoviesState>>(
      StateNotifierProvider<MoviesNotifier, MoviesState>(
          (_) => MoviesNotifier()));

  final router = RouteNotifier();
  locator.registerSingleton<GoRouter>(GoRouter(
    refreshListenable: router,
    routes: router.routes,
  ));
}
