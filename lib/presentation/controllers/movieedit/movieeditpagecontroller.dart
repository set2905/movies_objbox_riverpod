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
    var status = Formz.validate([
      MovieNameFormz.dirty(mov.name),
      MovieYearFormz.dirty(mov.year.toString()),
    ])
        ? FormzSubmissionStatus.success
        : FormzSubmissionStatus.failure;

    return EditMovieState(mov, status: status);
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

  void updateYear(String value) {
    final yearFormz = MovieYearFormz.dirty(value);
    if (state.value == null) return;
    state = AsyncValue.data(state.value!.copyWith(
        yearFormz: yearFormz, status: validate(yearFormz: yearFormz)));
  }

  Future<void> submit() async {
    if (state.isLoading ||
        state.value == null ||
        state.value!.status != FormzSubmissionStatus.success) return;
    state = const AsyncLoading();
    MoviesRepo moviesRepo = locator();
    EditMovieState stateValue = state.value!;
    stateValue.movie.name = stateValue.nameFormz.value;
    stateValue.movie.year = int.parse(stateValue.yearFormz.value);
    int id = await moviesRepo.putMovie(stateValue.movie);
    Movie edited = await moviesRepo.getById(id) ?? Movie();
    stateValue.movie.id = edited.id;
    state = AsyncValue.data(state.value!.copyWith(movie: edited));
  }

  Future<void> delete() async {
    if (state.isLoading ||
        state.value == null ||
        state.value!.status != FormzSubmissionStatus.success) return;
    state = const AsyncLoading();
    MoviesRepo moviesRepo = locator();
    EditMovieState stateValue = state.value!;
    if (stateValue.movie.id == 0) return;
    moviesRepo.removeMovie(stateValue.movie.id);
  }
}
