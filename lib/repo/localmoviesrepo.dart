import 'package:movies_objbox_riverpod/persistence/objectboxdb.dart';

import '../domain/models/movie.dart';
import '../objectbox.g.dart';
import 'interfaces/moviesrepo.dart';

class LocalMoviesRepo implements MoviesRepo {
  static const int defaultpagesize = 10;
  final ObjectBoxDb objectBoxDb;

  LocalMoviesRepo({required this.objectBoxDb});

  @override
  Future<int> putMovie(Movie movie) async {
    final Box<Movie> box = await objectBoxDb.movieBox;
    return box.putAsync(movie);
  }

  @override
  Future removeMovie(int movieId) async {
    final Box<Movie> box = await objectBoxDb.movieBox;
    await box.removeAsync(movieId);
  }

  @override
  Future<List<Movie>> getMovies(int page, {String? search}) async {
    final Box<Movie> box = await objectBoxDb.movieBox;
    final Query<Movie> query =
        box.query(search != null ? Movie_.name.contains(search) : null).build()
          ..offset = page - 1
          ..limit = defaultpagesize;
    final result = await query.findAsync();
    query.close();
    return result;
  }

  @override
  Future<Movie?> getById(int id) async {
    if (id == 0) return null;
    final Box<Movie> box = await objectBoxDb.movieBox;
    return await box.getAsync(id);
  }
}
