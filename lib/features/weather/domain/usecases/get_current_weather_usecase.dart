import 'package:skylite/core/resources/data_state.dart';
import 'package:skylite/core/usecases/usecase.dart';
import 'package:skylite/features/weather/data/repository/weather_repository.dart';
import 'package:skylite/features/weather/domain/entities/current_city_entity.dart';

class GetCurrentWeatherUsecase
    implements Usecase<DataState<CurrentCityEntity>, String> {
  final WeatherRepository weatherRepository;
  GetCurrentWeatherUsecase(this.weatherRepository);

  @override
  Future<DataState<CurrentCityEntity>> call(String cityName) {
    return weatherRepository.fetchCurrentWeatherData(cityName);
  }
}
