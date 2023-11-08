// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movieeditstate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditMovieState {
  Movie get movie => throw _privateConstructorUsedError;
  List<Country> get countries => throw _privateConstructorUsedError;
  Country? get selectedCountry => throw _privateConstructorUsedError;
  MovieNameFormz get nameFormz => throw _privateConstructorUsedError;
  MovieYearFormz get yearFormz => throw _privateConstructorUsedError;
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditMovieStateCopyWith<EditMovieState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditMovieStateCopyWith<$Res> {
  factory $EditMovieStateCopyWith(
          EditMovieState value, $Res Function(EditMovieState) then) =
      _$EditMovieStateCopyWithImpl<$Res, EditMovieState>;
  @useResult
  $Res call(
      {Movie movie,
      List<Country> countries,
      Country? selectedCountry,
      MovieNameFormz nameFormz,
      MovieYearFormz yearFormz,
      FormzSubmissionStatus status});
}

/// @nodoc
class _$EditMovieStateCopyWithImpl<$Res, $Val extends EditMovieState>
    implements $EditMovieStateCopyWith<$Res> {
  _$EditMovieStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
    Object? countries = null,
    Object? selectedCountry = freezed,
    Object? nameFormz = null,
    Object? yearFormz = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
      countries: null == countries
          ? _value.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<Country>,
      selectedCountry: freezed == selectedCountry
          ? _value.selectedCountry
          : selectedCountry // ignore: cast_nullable_to_non_nullable
              as Country?,
      nameFormz: null == nameFormz
          ? _value.nameFormz
          : nameFormz // ignore: cast_nullable_to_non_nullable
              as MovieNameFormz,
      yearFormz: null == yearFormz
          ? _value.yearFormz
          : yearFormz // ignore: cast_nullable_to_non_nullable
              as MovieYearFormz,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditMovieStateImplCopyWith<$Res>
    implements $EditMovieStateCopyWith<$Res> {
  factory _$$EditMovieStateImplCopyWith(_$EditMovieStateImpl value,
          $Res Function(_$EditMovieStateImpl) then) =
      __$$EditMovieStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Movie movie,
      List<Country> countries,
      Country? selectedCountry,
      MovieNameFormz nameFormz,
      MovieYearFormz yearFormz,
      FormzSubmissionStatus status});
}

/// @nodoc
class __$$EditMovieStateImplCopyWithImpl<$Res>
    extends _$EditMovieStateCopyWithImpl<$Res, _$EditMovieStateImpl>
    implements _$$EditMovieStateImplCopyWith<$Res> {
  __$$EditMovieStateImplCopyWithImpl(
      _$EditMovieStateImpl _value, $Res Function(_$EditMovieStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
    Object? countries = null,
    Object? selectedCountry = freezed,
    Object? nameFormz = null,
    Object? yearFormz = null,
    Object? status = null,
  }) {
    return _then(_$EditMovieStateImpl(
      null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
      null == countries
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<Country>,
      freezed == selectedCountry
          ? _value.selectedCountry
          : selectedCountry // ignore: cast_nullable_to_non_nullable
              as Country?,
      nameFormz: null == nameFormz
          ? _value.nameFormz
          : nameFormz // ignore: cast_nullable_to_non_nullable
              as MovieNameFormz,
      yearFormz: null == yearFormz
          ? _value.yearFormz
          : yearFormz // ignore: cast_nullable_to_non_nullable
              as MovieYearFormz,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
    ));
  }
}

/// @nodoc

class _$EditMovieStateImpl implements _EditMovieState {
  const _$EditMovieStateImpl(
      this.movie, final List<Country> countries, this.selectedCountry,
      {this.nameFormz = const MovieNameFormz.pure(),
      this.yearFormz = const MovieYearFormz.pure(),
      this.status = FormzSubmissionStatus.initial})
      : _countries = countries;

  @override
  final Movie movie;
  final List<Country> _countries;
  @override
  List<Country> get countries {
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countries);
  }

  @override
  final Country? selectedCountry;
  @override
  @JsonKey()
  final MovieNameFormz nameFormz;
  @override
  @JsonKey()
  final MovieYearFormz yearFormz;
  @override
  @JsonKey()
  final FormzSubmissionStatus status;

  @override
  String toString() {
    return 'EditMovieState(movie: $movie, countries: $countries, selectedCountry: $selectedCountry, nameFormz: $nameFormz, yearFormz: $yearFormz, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditMovieStateImpl &&
            (identical(other.movie, movie) || other.movie == movie) &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries) &&
            (identical(other.selectedCountry, selectedCountry) ||
                other.selectedCountry == selectedCountry) &&
            (identical(other.nameFormz, nameFormz) ||
                other.nameFormz == nameFormz) &&
            (identical(other.yearFormz, yearFormz) ||
                other.yearFormz == yearFormz) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      movie,
      const DeepCollectionEquality().hash(_countries),
      selectedCountry,
      nameFormz,
      yearFormz,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditMovieStateImplCopyWith<_$EditMovieStateImpl> get copyWith =>
      __$$EditMovieStateImplCopyWithImpl<_$EditMovieStateImpl>(
          this, _$identity);
}

abstract class _EditMovieState implements EditMovieState {
  const factory _EditMovieState(final Movie movie,
      final List<Country> countries, final Country? selectedCountry,
      {final MovieNameFormz nameFormz,
      final MovieYearFormz yearFormz,
      final FormzSubmissionStatus status}) = _$EditMovieStateImpl;

  @override
  Movie get movie;
  @override
  List<Country> get countries;
  @override
  Country? get selectedCountry;
  @override
  MovieNameFormz get nameFormz;
  @override
  MovieYearFormz get yearFormz;
  @override
  FormzSubmissionStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$EditMovieStateImplCopyWith<_$EditMovieStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
