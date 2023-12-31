// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movieeditpagecontroller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieEditPageControllerHash() =>
    r'd684ea541d5871f62ac4f8e2d8107642f9da47dd';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$MovieEditPageController
    extends BuildlessAutoDisposeAsyncNotifier<EditMovieState> {
  late final int id;

  FutureOr<EditMovieState> build(
    int id,
  );
}

/// See also [MovieEditPageController].
@ProviderFor(MovieEditPageController)
const movieEditPageControllerProvider = MovieEditPageControllerFamily();

/// See also [MovieEditPageController].
class MovieEditPageControllerFamily extends Family<AsyncValue<EditMovieState>> {
  /// See also [MovieEditPageController].
  const MovieEditPageControllerFamily();

  /// See also [MovieEditPageController].
  MovieEditPageControllerProvider call(
    int id,
  ) {
    return MovieEditPageControllerProvider(
      id,
    );
  }

  @override
  MovieEditPageControllerProvider getProviderOverride(
    covariant MovieEditPageControllerProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'movieEditPageControllerProvider';
}

/// See also [MovieEditPageController].
class MovieEditPageControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MovieEditPageController,
        EditMovieState> {
  /// See also [MovieEditPageController].
  MovieEditPageControllerProvider(
    int id,
  ) : this._internal(
          () => MovieEditPageController()..id = id,
          from: movieEditPageControllerProvider,
          name: r'movieEditPageControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieEditPageControllerHash,
          dependencies: MovieEditPageControllerFamily._dependencies,
          allTransitiveDependencies:
              MovieEditPageControllerFamily._allTransitiveDependencies,
          id: id,
        );

  MovieEditPageControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  FutureOr<EditMovieState> runNotifierBuild(
    covariant MovieEditPageController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(MovieEditPageController Function() create) {
    return ProviderOverride(
      origin: this,
      override: MovieEditPageControllerProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MovieEditPageController,
      EditMovieState> createElement() {
    return _MovieEditPageControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieEditPageControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MovieEditPageControllerRef
    on AutoDisposeAsyncNotifierProviderRef<EditMovieState> {
  /// The parameter `id` of this provider.
  int get id;
}

class _MovieEditPageControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MovieEditPageController,
        EditMovieState> with MovieEditPageControllerRef {
  _MovieEditPageControllerProviderElement(super.provider);

  @override
  int get id => (origin as MovieEditPageControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
