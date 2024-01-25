import 'package:equatable/equatable.dart';

import '../../data/models/current_city_model/clouds.dart';
import '../../data/models/current_city_model/coord.dart';
import '../../data/models/current_city_model/main.dart';
import '../../data/models/current_city_model/rain.dart';
import '../../data/models/current_city_model/sys.dart';
import '../../data/models/current_city_model/weather.dart';
import '../../data/models/current_city_model/wind.dart';

class CurrentCityEntity extends Equatable {
  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final Main? main;
  final int? visibility;
  final Wind? wind;
  final Rain? rain;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  const CurrentCityEntity(
      {this.coord,
      this.weather,
      this.main,
      this.base,
      this.visibility,
      this.wind,
      this.rain,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
