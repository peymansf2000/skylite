import 'package:dio/dio.dart';
import 'package:skylite/core/params/forecast_params.dart';
import 'package:skylite/core/utils/constants.dart';
import 'package:skylite/features/weather/domain/entities/current_city_entity.dart';

var apiKey = Constants.openWeather['apiKey'];

class ApiProvider {
  final Dio _dio = Dio();

  /// current weather api
  Future<dynamic> callCurrentWeather(cityName) async {
    var response = await _dio.get(
        "${Constants.openWeather['baseUrl']}/data/2.5/weather",
        queryParameters: {'q': cityName, 'appid': apiKey, 'units': 'metric'});
    return response;
  }

  Future<dynamic> callForecastWeather(ForecastParams forecastParams) async {
    var response = await _dio.get(
        "${Constants.openWeather['baseUrl']}/data/2.5/forecast/daily",
        queryParameters: {
          'lat': forecastParams.lat,
          'lon': forecastParams.lon,
          'appid': apiKey
        });
    return response;
  }
}
