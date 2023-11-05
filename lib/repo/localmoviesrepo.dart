import 'package:movies_objbox_riverpod/persistence/objectboxdb.dart';

import '../domain/models/movie.dart';
import '../objectbox.g.dart';
import 'interfaces/moviesrepo.dart';

class LocalMoviesRepo implements MoviesRepo {
  static const int defaultpagesize = 10;
  final ObjectBoxDb objectBoxDb;

  LocalMoviesRepo({required this.objectBoxDb});

  Future putMovie() async {
    await objectBoxDb.store;
  }

  Future<List<Movie>> getMovies(int page) async {
    final Store? store = await objectBoxDb.store;
    //nado error
    if (store == null) return List.empty();
    final Query<Movie> query = store.box<Movie>().query().build()
      ..offset = 10
      ..limit = 5;
      return await query.findAsync();
  }

  
}
