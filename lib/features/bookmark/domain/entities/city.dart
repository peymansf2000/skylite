import 'package:isar/isar.dart';

part 'city.g.dart';

@collection
class City {
  Id id = Isar.autoIncrement;

  String? name;
}
