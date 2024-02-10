import 'package:skylite/core/params/forecast_params.dart';
import 'package:skylite/core/resources/data_state.dart';
import 'package:skylite/features/weather/data/models/geodb/suggest_city_model/datum.dart';
import 'package:skylite/features/weather/domain/entities/weather_entity.dart';

abstract class IWeatherRepository {
  Future<DataState<WeatherEntity>> fetchWeatherData(SuggestionParams params);
  Future<List<Datum>> fetchSuggestData(String prefix);
}
