import 'package:dio/dio.dart';
import 'package:skylite/core/params/forecast_params.dart';
import 'package:skylite/core/resources/data_state.dart';
import 'package:skylite/features/weather/data/models/geodb/suggest_city_model/datum.dart';
import 'package:skylite/features/weather/data/models/geodb/suggest_city_model/suggest_city_model.dart';
import 'package:skylite/features/weather/data/models/visualcrossing/current_plus_forecast_model/current_plus_forecast_model.dart';
import 'package:skylite/features/weather/data/models/weather_model.dart';
import 'package:skylite/features/weather/domain/entities/suggest_city_entity.dart';
import 'package:skylite/features/weather/domain/entities/weather_entity.dart';

import '../../domain/repository/weather_repository.dart';
import '../data_source/remote/api_provider.dart';

class WeatherRepository implements IWeatherRepository {
  final ApiProvider _apiProvider;
  WeatherRepository(this._apiProvider);

  @override
  Future<DataState<WeatherEntity>> fetchWeatherData(
      SuggestionParams params) async {
    try {
      /// openweather => callCurrentweather(cityName) visualcrossing => requestWeatherData(cityName)
      Response response =
          await _apiProvider.requestWeatherData(params.location);

      if (response.statusCode == 200) {
        //# openweather api #
        // CurrentWeatherModel currentWeatherModel =
        //     CurrentWeatherModel.fromJson(response.data);
        // WeatherModel weatherModel = currentWeatherModel.getWeatherModel();

        //# visualcrossing api #
        CurrentPlusForecastModel currentPlusForecastModel =
            CurrentPlusForecastModel.fromJson(response.data);
        WeatherModel weatherModel =
            currentPlusForecastModel.getWeatherModel(params.name);

        return DataSuccess(weatherModel);
      } else {
        return const DataFailed('Something went wrong. Try again ...');
      }
    } catch (e) {
      return const DataFailed('Something went wrong. Try again ...');
    }
  }

  @override
  Future<List<Datum>> fetchSuggestData(String prefix) async {
    Response response = await _apiProvider.requestCitySuggetion(prefix);

    SuggestCityEntity suggestCityEntity =
        SuggestCityModel.fromJson(response.data);
    return suggestCityEntity.data!;
  }
}
