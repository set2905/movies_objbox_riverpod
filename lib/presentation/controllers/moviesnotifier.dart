import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_objbox_riverpod/domain/models/movie.dart';
import 'package:movies_objbox_riverpod/presentation/controllers/moviesstate.dart';
import 'package:movies_objbox_riverpod/repo/interfaces/moviesrepo.dart';
import 'package:movies_objbox_riverpod/utils/dependencyinjection.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import 'package:state_notifier/state_notifier.dart';

class MoviesNotifier extends StateNotifier<MoviesState>
    with PagedNotifierMixin<int, Movie, MoviesState> {
  MoviesNotifier() : super(const MoviesState());

  @override
  Future<List<Movie>?> load(int page, int limit) async {
    try {
      if (state.previousPageKeys.contains(page)) {
        state = state.copyWith();
        return state.records;
      }
      final MoviesRepo moviesRepo = locator();
      List<Movie> movies =
          await moviesRepo.getMovies(page, search: state.search);

      state = state.copyWith(
          records: [...(state.records ?? []), ...movies],
          nextPageKey: movies.length < limit ? null : movies[movies.length - 1].id,
          previousPageKeys: {...state.previousPageKeys, page}.toList());
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
    return null;
  }
  final moviesProvider =
    StateNotifierProvider<MoviesNotifier, MoviesState>(
        (_) => MoviesNotifier());
}
