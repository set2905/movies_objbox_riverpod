import 'package:movies_objbox_riverpod/domain/models/movie.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class MoviesState extends PagedState<int, Movie> {
final String? search;
  const MoviesState(
      {
        this.search,
      List<Movie>? records,
      String? error,
      int? nextPageKey,
      List<int>? previousPageKeys})
      : super(records: records, error: error, nextPageKey: nextPageKey);

  @override
  MoviesState copyWith(
      {
      List<Movie>? records,
      dynamic error,
      dynamic nextPageKey,
      List<int>? previousPageKeys}) {
    final sup = super.copyWith(
        records: records,
        error: error,
        nextPageKey: nextPageKey,
        previousPageKeys: previousPageKeys);
    return MoviesState(
        records: sup.records,
        error: sup.error,
        nextPageKey: sup.nextPageKey,
        previousPageKeys: sup.previousPageKeys);
  }
}