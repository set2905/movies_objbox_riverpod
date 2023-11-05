import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_objbox_riverpod/domain/models/movie.dart';
import 'package:movies_objbox_riverpod/repo/interfaces/moviesrepo.dart';
import 'package:movies_objbox_riverpod/utils/dependencyinjection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'moviescontroller.g.dart';

@riverpod
class MoviesController extends _$MoviesController {
  @override
  Future<List<Movie>> build() async {
    final MoviesRepo moviesRepo = locator();
    return await moviesRepo.getMovies(1);
  }

  Future<void> loadMovies(int page, {String? search}) async {
    final MoviesRepo moviesRepo = locator();
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => moviesRepo.getMovies(page, search: search));
  }
}
