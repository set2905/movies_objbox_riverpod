import 'package:formz/formz.dart';
import 'package:movies_objbox_riverpod/domain/models/movie.dart';
import 'package:movies_objbox_riverpod/presentation/controllers/movieedit/movieeditstate.dart';
import 'package:movies_objbox_riverpod/presentation/forms/movieform.dart';
import 'package:movies_objbox_riverpod/repo/interfaces/moviesrepo.dart';
import 'package:movies_objbox_riverpod/utils/dependencyinjection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movieeditpagecontroller.g.dart';

@riverpod
class MovieEditPageController extends _$MovieEditPageController {
  @override
  Future<EditMovieState> build(int id) async {
    final MoviesRepo moviesRepo = locator();
    var mov = await moviesRepo.getById(id) ?? Movie();
    return EditMovieState(mov);
  }

  FormzSubmissionStatus validate(
      {MovieNameFormz? nameFormz, MovieYearFormz? yearFormz}) {
    return Formz.validate([
      nameFormz ?? state.value!.nameFormz,
      yearFormz ?? state.value!.yearFormz
    ])
        ? FormzSubmissionStatus.success
        : FormzSubmissionStatus.failure;
  }

  void updateName(String value) {
    final nameFormz = MovieNameFormz.dirty(value);
    if (state.value == null) return;
    state = AsyncValue.data(state.value!.copyWith(
        nameFormz: nameFormz, status: validate(nameFormz: nameFormz)));
  }
}
