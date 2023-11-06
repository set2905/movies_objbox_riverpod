import '../../domain/models/movie.dart';

abstract class MoviesRepo {
  Future putMovie(Movie movie);
  Future removeMovie(int movieId);
  Future<List<Movie>> getMovies(int page, {String? search});
  Future<Movie?> getById(int id);
}
