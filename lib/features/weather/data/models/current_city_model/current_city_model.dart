import 'package:flutter/foundation.dart';
import 'package:skylite/features/weather/domain/entities/current_city_entity.dart';

import 'current_city_model/clouds.dart';
import 'current_city_model/coord.dart';
import 'current_city_model/main.dart';
import 'current_city_model/rain.dart';
import 'current_city_model/sys.dart';
import 'current_city_model/weather.dart';
import 'current_city_model/wind.dart';

class CurrentCityModel extends CurrentCityEntity {
  CurrentCityModel({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Rain? rain,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) : super(
            coord: null,
            weather: null,
            base: '',
            main: null,
            visibility: 0,
            wind: null,
            rain: null,
            clouds: null,
            dt: 0,
            sys: null,
            timezone: 0,
            id: 0,
            name: '',
            cod: 0);

  factory CurrentCityModel.fromJson(Map<String, dynamic> json) {
    return CurrentCityModel(
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
}