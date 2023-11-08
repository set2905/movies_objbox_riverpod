import 'package:movies_objbox_riverpod/domain/models/country.dart';
import 'package:movies_objbox_riverpod/objectbox.g.dart';
import 'package:movies_objbox_riverpod/persistence/objectboxdb.dart';
import 'package:movies_objbox_riverpod/repo/interfaces/countriesrepo.dart';

class LocalCountriesRepo implements CountriesRepo {
  final ObjectBoxDb objectBoxDb;
  LocalCountriesRepo({required this.objectBoxDb});
  @override
  Future<List<Country>> getCountries() async {
    final Box<Country> box = await objectBoxDb.countryBox;
    return await box.getAllAsync();
  }
}
