import 'package:dio/dio.dart';
import 'package:skylite/core/resources/data_state.dart';
import 'package:skylite/features/weather/data/models/current_city_model/current_city_model.dart';

import 'package:skylite/features/weather/domain/entities/current_city_entity.dart';

import '../../domain/repository/weather_repository.dart';
import '../data_source/remote/api_provider.dart';

class WeatherRepository implements IWeatherRepository {
  final ApiProvider _apiProvider;
  WeatherRepository(this._apiProvider);

  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(
      String cityName) async {
    try {
      Response response = await _apiProvider.callCurrentWeather(cityName);

      if (response.statusCode == 200) {
        CurrentCityEntity currentCityEntity =
            CurrentCityModel.fromJson(response.data);

        return DataSuccess(currentCityEntity);
      } else {
        return const DataFailed('Something went wrong. Try again ...');
      }
    } catch (e) {
      return const DataFailed('Something went wrong. Try again ...');
    }
  }
}
