import 'package:skylite/features/weather/data/models/weather_model.dart';

import '../../day_model.dart';
import 'clouds.dart';
import 'coord.dart';
import 'main.dart';
import 'rain.dart';
import 'sys.dart';
import 'weather.dart';
import 'wind.dart';

class CurrentWeatherModel {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Rain? rain;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  CurrentWeatherModel({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.rain,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      coord: json['coord'] == null
          ? null
          : Coord.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      base: json['base'] as String?,
      main: json['main'] == null
          ? null
          : Main.fromJson(json['main'] as Map<String, dynamic>),
      visibility: json['visibility'] as int?,
      wind: json['wind'] == null
          ? null
          : Wind.fromJson(json['wind'] as Map<String, dynamic>),
      rain: json['rain'] == null
          ? null
          : Rain.fromJson(json['rain'] as Map<String, dynamic>),
      clouds: json['clouds'] == null
          ? null
          : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      dt: json['dt'] as int?,
      sys: json['sys'] == null
          ? null
          : Sys.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: json['timezone'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      cod: json['cod'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'coord': coord?.toJson(),
        'weather': weather?.map((e) => e.toJson()).toList(),
        'base': base,
        'main': main?.toJson(),
        'visibility': visibility,
        'wind': wind?.toJson(),
        'rain': rain?.toJson(),
        'clouds': clouds?.toJson(),
        'dt': dt,
        'sys': sys?.toJson(),
        'timezone': timezone,
        'id': id,
        'name': name,
        'cod': cod,
      };
  WeatherModel getWeatherModel() {
    return WeatherModel(
      address: name!,
      day: DayModel(
          timeStamp: dt!,
          tempMax: main!.tempMax!.round(),
          tempMin: main!.tempMin!.round(),
          temp: main!.temp!.round(),
          feelsLike: main!.feelsLike!.round(),
          humidity: main!.humidity!,
          pressure: main!.pressure!,
          description: weather![0].description!,
          icon: weather![0].icon!,
          sunsetEpoch: 0,
          sunriseEpoch: 0,
          windSpeed: 0.0),
      name: null,
      tzoffset: null,
    );
  }
}
