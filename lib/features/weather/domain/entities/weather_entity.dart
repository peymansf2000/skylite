import '../../data/models/day_model.dart';

class WeatherEntity {
  final String name;
  final String address;
  final double tzoffset;
  List<DayModel> day;
  WeatherEntity(
      {required this.tzoffset,
      required this.name,
      required this.address,
      required this.day});
}
