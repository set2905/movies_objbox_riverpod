import 'dart:async';

import 'package:faker/faker.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_objbox_riverpod/constants/strings.dart';
import 'package:movies_objbox_riverpod/domain/models/country.dart';
import 'package:path/path.dart' as path;
import 'package:movies_objbox_riverpod/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

import '../domain/models/movie.dart';

class ObjectBoxDb implements Disposable {
  Store? _store;

  Future<Store?> get store async {
    _store ??= await _create();
    return _store;
  }

  Future<Box<Movie>> get movieBox async {
    final Box<Movie>? box = (await store)?.box<Movie>();
    if (box == null) throw Exception("Store is not initialized");
    return box;
  }

  Future<Box<Country>> get countryBox async {
    final Box<Country>? box = (await store)?.box<Country>();
    if (box == null) throw Exception("Store is not initialized");
    return box;
  }

  Future<Store> _create() async {
    final appDir = await getApplicationDocumentsDirectory();
    final dbPath = path.join(appDir.path, "MoviesObjectBox");
    final store = await openStore(directory: dbPath);
    await tryInitCountries(store);
    await tryInitMovies(store);
    return store;
  }

  Future<void> tryInitCountries(Store store) async {
    var countryBox = store.box<Country>();
    if (countryBox.count() != 0) return;
    await countryBox.putManyAsync(List<Country>.from(
        Strings.defaultCountryNames.map((e) => Country()..name = e)));
  }

  Future<void> tryInitMovies(Store store) async {
    if (store.box<Movie>().count() != 0) return;
    await store.box<Movie>().removeAllAsync();
    var box = store.box<Movie>();
    var countries = await store.box<Country>().getAllAsync();
    var faker = Faker();
    await box.putManyAsync(List<Movie>.generate(
        5000,
        (index) => Movie()
          ..name = faker.lorem.word()
          ..year = random.integer(2050, min: 1896)
          ..country.target =
              countries[random.integer(countries.length, min: 0)]));
  }

  @override
  FutureOr onDispose() {
    _store?.close();
  }
}
