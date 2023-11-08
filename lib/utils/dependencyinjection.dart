import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_objbox_riverpod/persistence/objectboxdb.dart';
import 'package:movies_objbox_riverpod/repo/interfaces/countriesrepo.dart';
import 'package:movies_objbox_riverpod/repo/interfaces/moviesrepo.dart';
import 'package:movies_objbox_riverpod/repo/localcountriesrepo.dart';
import 'package:movies_objbox_riverpod/repo/localmoviesrepo.dart';

import '../presentation/routing/gorouterbuilder.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<ObjectBoxDb>(() => ObjectBoxDb());

  locator.registerLazySingleton<MoviesRepo>(
      () => LocalMoviesRepo(objectBoxDb: locator()));
  locator.registerLazySingleton<CountriesRepo>(
      () => LocalCountriesRepo(objectBoxDb: locator()));



  locator.registerSingleton<GoRouter>(GoRouter(
    routes: $appRoutes,
  ));
}
