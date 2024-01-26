import 'package:skylite/core/resources/data_state.dart';
import 'package:skylite/features/weather/domain/entities/current_city_entity.dart';

abstract class IWeatherRepository {
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(String cityName);
}
