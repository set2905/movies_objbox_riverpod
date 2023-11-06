import 'dart:async';
import 'package:movies_objbox_riverpod/domain/models/movie.dart';
import 'package:movies_objbox_riverpod/repo/interfaces/moviesrepo.dart';
import 'package:movies_objbox_riverpod/utils/dependencyinjection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movielandingpagecontroller.g.dart';

@riverpod
class MovieLandingPageController extends _$MovieLandingPageController {
  @override
  Future<Movie> build(int id) async {
    final MoviesRepo moviesRepo = locator();
    return await moviesRepo.getById(id) ?? Movie();
  }
}
