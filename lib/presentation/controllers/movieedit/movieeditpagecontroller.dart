import 'package:movies_objbox_riverpod/domain/models/movie.dart';
import 'package:movies_objbox_riverpod/repo/interfaces/moviesrepo.dart';
import 'package:movies_objbox_riverpod/utils/dependencyinjection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movieeditpagecontroller.g.dart';

@riverpod
class MovieEditPageController extends _$MovieEditPageController {
  @override
  Future<Movie> build(int id) async {
    final MoviesRepo moviesRepo = locator();
    return await moviesRepo.getById(id) ?? Movie();
  }
}