import 'package:movies_objbox_riverpod/domain/models/country.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Movie 
{
  int id = 0;
  String name = "";
  int year = 0;
  final country = ToOne<Country>();
}
