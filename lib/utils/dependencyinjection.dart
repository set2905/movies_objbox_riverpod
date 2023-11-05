import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_objbox_riverpod/domain/models/movie.dart';
import 'package:movies_objbox_riverpod/persistence/objectboxdb.dart';
import 'package:movies_objbox_riverpod/presentation/controllers/moviescontroller.dart';
import 'package:movies_objbox_riverpod/repo/interfaces/moviesrepo.dart';
import 'package:movies_objbox_riverpod/repo/localmoviesrepo.dart';

import '../presentation/routenotifier.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<ObjectBoxDb>(() => ObjectBoxDb());

  locator.registerLazySingleton<MoviesRepo>(
      () => LocalMoviesRepo(objectBoxDb: locator()));

  locator.registerSingleton<MoviesController>(MoviesController());

  final router = RouteNotifier();
  locator.registerSingleton<GoRouter>(GoRouter(
    refreshListenable: router,
    routes: router.routes,
  ));
}
