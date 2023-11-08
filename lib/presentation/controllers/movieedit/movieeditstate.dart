import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_objbox_riverpod/domain/models/country.dart';
import 'package:movies_objbox_riverpod/domain/models/movie.dart';
import 'package:movies_objbox_riverpod/presentation/forms/movieform.dart';
part 'movieeditstate.freezed.dart';

@freezed
class EditMovieState with _$EditMovieState {
  const factory EditMovieState(
    Movie movie,
    List<Country> countries,
    Country? selectedCountry,
    {
    @Default(MovieNameFormz.pure()) MovieNameFormz nameFormz,
    @Default(MovieYearFormz.pure()) MovieYearFormz yearFormz,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
  }) = _EditMovieState;
}