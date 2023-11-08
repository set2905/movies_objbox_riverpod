import 'package:movies_objbox_riverpod/domain/models/country.dart';

abstract class CountriesRepo {
  Future<List<Country>> getCountries();
}
