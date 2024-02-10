import 'package:dio/dio.dart';
import 'package:skylite/core/utils/constants.dart';

class ApiProvider {
  final Dio _dio = Dio();
  var apiKey = Constants.openWeather['apiKey'];

  /// current weather api of openweather
  Future<dynamic> callCurrentWeather(cityName) async {
    var response = await _dio.get(
        "${Constants.openWeather['baseUrl']}/data/2.5/weather",
        queryParameters: {'q': cityName, 'appid': apiKey, 'units': 'metric'});
    return response;
  }

//   Future<dynamic> callForecastWeather(ForecastParams forecastParams) async {
//     var response = await _dio.get(
//         "${Constants.openWeather['baseUrl']}/data/2.5/forecast/daily",
//         queryParameters: {
//           'lat': forecastParams.lat,
//           'lon': forecastParams.lon,
//           'appid': apiKey
//         });
//     return response;
//   }
// }
  /// current weather api of openweather
  Future<dynamic> requestWeatherData(cityName) async {
    var apiKey = Constants.visualcrossing['apiKey'];

    var response = await _dio.get(
        "${Constants.visualcrossing['baseUrl']}/VisualCrossingWebServices/rest/services/timeline/$cityName",
        queryParameters: {
          'key': apiKey,
          'unitGroup': 'metric',
          'include': 'days'
        });
    return response;
  }

  Future<dynamic> requestCitySuggetion(String prefix) async {
    var response = await _dio
        .get("${Constants.geodb['baseUrl']}/v1/geo/cities", queryParameters: {
      'namePrefix': prefix,
      'limit': 7,
    });
    return response;
  }
}
