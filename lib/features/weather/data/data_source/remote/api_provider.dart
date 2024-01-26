import 'package:dio/dio.dart';
import 'package:skylite/core/utils/constants.dart';

class ApiProvider {
  final Dio _dio = Dio();

  var apiKey = Constants.openWeather['apiKey'];

  /// current weather api
  Future<dynamic> callCurrentWeather(cityName) async {
    var response = await _dio.get(
        "${Constants.openWeather['baseUrl']}/data/2.5/weather",
        queryParameters: {'q': cityName, 'appid': apiKey, 'units': 'metric'});
    return response;
  }
}
