import 'package:formz/formz.dart';
import 'package:movies_objbox_riverpod/domain/models/movie.dart';
import 'package:movies_objbox_riverpod/utils/validators.dart';

enum NameValidationError {
  empty,
  tooLong
  ;

  String getMessage() {
    switch (this) {
      case empty:
        return 'Movie name can\'t be empty';
        case tooLong:
        return 'Movie name is too long';

    }
  }
}

enum YearValidationError {
  invalid,
  ;

  String getMessage() {
    switch (this) {
      case invalid:
        return 'Year is not valid';
    }
  }
}


class MovieNameFormz extends FormzInput<String, NameValidationError> {
  const MovieNameFormz.pure() : super.pure('');

  const MovieNameFormz.dirty(String value) : super.dirty(value);

  @override
  NameValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) return NameValidationError.empty;
    if (!MaxLengthStringValidator(Movie.maxMovieNameLength).isValid(value)) return NameValidationError.empty;
    return null;
  }
}

class MovieYearFormz extends FormzInput<String, YearValidationError> {
  const MovieYearFormz.pure() : super.pure('');
  const MovieYearFormz.dirty(String value) : super.dirty(value);
  @override
  YearValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) return YearValidationError.invalid;
    if (!StringYearValidator().isValid(value)) return YearValidationError.invalid;
    return null;
  }
}
