import 'package:skylite/features/weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({required name, required address, required day})
      : super(name: name, address: address, day: day);
}
