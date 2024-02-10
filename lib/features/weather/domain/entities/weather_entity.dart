import '../../data/models/day_model.dart';

class WeatherEntity {
  final String name;
  final String address;
  List<DayModel> day;
  WeatherEntity({required this.name, required this.address, required this.day});
}
