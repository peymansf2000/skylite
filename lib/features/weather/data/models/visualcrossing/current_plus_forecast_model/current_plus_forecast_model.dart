import 'package:skylite/features/weather/data/models/day_model.dart';
import 'package:skylite/features/weather/data/models/weather_model.dart';

import 'day.dart';
import 'stations.dart';

class CurrentPlusForecastModel {
  int? queryCost;
  double? latitude;
  double? longitude;
  String? resolvedAddress;
  String? address;
  String? timezone;
  double? tzoffset;
  List<Day>? days;
  Stations? stations;

  CurrentPlusForecastModel({
    this.queryCost,
    this.latitude,
    this.longitude,
    this.resolvedAddress,
    this.address,
    this.timezone,
    this.tzoffset,
    this.days,
    this.stations,
  });

  factory CurrentPlusForecastModel.fromJson(Map<String, dynamic> json) {
    return CurrentPlusForecastModel(
      queryCost: json['queryCost'] as int?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      resolvedAddress: json['resolvedAddress'] as String?,
      address: json['address'] as String?,
      timezone: json['timezone'] as String?,
      tzoffset: (json['tzoffset'] as num?)?.toDouble(),
      days: (json['days'] as List<dynamic>?)
          ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
      stations: json['stations'] == null
          ? null
          : Stations.fromJson(json['stations'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'queryCost': queryCost,
        'latitude': latitude,
        'longitude': longitude,
        'resolvedAddress': resolvedAddress,
        'address': address,
        'timezone': timezone,
        'tzoffset': tzoffset,
        'days': days?.map((e) => e.toJson()).toList(),
        'stations': stations?.toJson(),
      };

  String _extractCity(String input) {
    // Define a regex pattern to capture the first part before the comma
    RegExp regex = RegExp(r'^([^,]+)');

    // Use the firstMatch method to find the match
    Match match = regex.firstMatch(input)!;

    // Extract the matched substring
    return match.group(1)!;
  }

  WeatherModel getWeatherModel(name) {
    name = name;
    List<DayModel> daysModelList = [];
    for (var element in days!) {
      daysModelList.add(DayModel(
          timeStamp: element.datetimeEpoch!,
          tempMax: element.tempmax!.round(),
          tempMin: element.tempmin!.round(),
          temp: element.temp!.round(),
          feelsLike: element.feelslike!.round(),
          humidity: element.humidity!.round(),
          pressure: element.pressure!.round(),
          description: element.conditions!,
          icon: _getIcon(element.icon!),
          sunsetEpoch: element.sunsetEpoch!,
          sunriseEpoch: element.sunriseEpoch!,
          windSpeed: element.windspeed!));
    }
    return WeatherModel(
        address: _extractCity(resolvedAddress!),
        day: daysModelList,
        name: name,
        tzoffset: tzoffset);
  }

  String _getIcon(element) {
    switch (element) {
      case 'snow':
        return '13d';
      case 'rain':
        return '09d';
      case 'fog':
        return '50d';
      case 'wind':
        return '50d';
      case 'cloudy':
        return '04d';
      case 'partly-cloudy-day':
        return '03d';
      case 'partly-cloudy-night':
        return '03d';
      case 'clear-day':
        return '01d';
      case 'clear-night':
        return '01n';
      default:
        return '00';
    }
  }
}
