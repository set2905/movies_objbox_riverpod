import 'package:movies_objbox_riverpod/domain/models/country.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Movie {
  static const int maxMovieNameLength = 128;
  int id = 0;
  @Index()
  String name = "";
  int year = 0;
  final country = ToOne<Country>();
}
