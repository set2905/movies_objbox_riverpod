import 'package:get_it/get_it.dart';
import 'package:movies_objbox_riverpod/persistence/objectboxdb.dart';
import 'package:movies_objbox_riverpod/repo/localmoviesrepo.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<ObjectBoxDb>(() => ObjectBoxDb());

  locator.registerLazySingleton<LocalMoviesRepo>(
      () => LocalMoviesRepo(objectBoxDb: locator()));

  //Handlers
  // locator.registerLazySingleton<NavigationHandler>(
  //   () => NavigationHandlerImpl(),
  // );

  // locator.registerLazySingleton<DialogHandler>(
  //   () => DialogHandlerImpl(),
  // );

  //Repositories
}
