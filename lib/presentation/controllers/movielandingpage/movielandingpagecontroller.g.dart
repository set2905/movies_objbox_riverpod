// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movielandingpagecontroller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieLandingPageControllerHash() =>
    r'f81503f299155a61b21c6194cbabd697a9772afa';

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

abstract class _$MovieLandingPageController
    extends BuildlessAutoDisposeAsyncNotifier<Movie> {
  late final int id;

  FutureOr<Movie> build(
    int id,
  );
}

/// See also [MovieLandingPageController].
@ProviderFor(MovieLandingPageController)
const movieLandingPageControllerProvider = MovieLandingPageControllerFamily();

/// See also [MovieLandingPageController].
class MovieLandingPageControllerFamily extends Family<AsyncValue<Movie>> {
  /// See also [MovieLandingPageController].
  const MovieLandingPageControllerFamily();

  /// See also [MovieLandingPageController].
  MovieLandingPageControllerProvider call(
    int id,
  ) {
    return MovieLandingPageControllerProvider(
      id,
    );
  }

  @override
  MovieLandingPageControllerProvider getProviderOverride(
    covariant MovieLandingPageControllerProvider provider,
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
  String? get name => r'movieLandingPageControllerProvider';
}

/// See also [MovieLandingPageController].
class MovieLandingPageControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MovieLandingPageController,
        Movie> {
  /// See also [MovieLandingPageController].
  MovieLandingPageControllerProvider(
    int id,
  ) : this._internal(
          () => MovieLandingPageController()..id = id,
          from: movieLandingPageControllerProvider,
          name: r'movieLandingPageControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieLandingPageControllerHash,
          dependencies: MovieLandingPageControllerFamily._dependencies,
          allTransitiveDependencies:
              MovieLandingPageControllerFamily._allTransitiveDependencies,
          id: id,
        );

  MovieLandingPageControllerProvider._internal(
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
  FutureOr<Movie> runNotifierBuild(
    covariant MovieLandingPageController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(MovieLandingPageController Function() create) {
    return ProviderOverride(
      origin: this,
      override: MovieLandingPageControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<MovieLandingPageController, Movie>
      createElement() {
    return _MovieLandingPageControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieLandingPageControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MovieLandingPageControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Movie> {
  /// The parameter `id` of this provider.
  int get id;
}

class _MovieLandingPageControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MovieLandingPageController,
        Movie> with MovieLandingPageControllerRef {
  _MovieLandingPageControllerProviderElement(super.provider);

  @override
  int get id => (origin as MovieLandingPageControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
