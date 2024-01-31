import 'package:skylite/core/resources/data_state.dart';
import 'package:skylite/core/usecases/usecase.dart';
import 'package:skylite/features/weather/domain/entities/current_city_entity.dart';
import 'package:skylite/features/weather/domain/repository/weather_repository.dart';

class GetCurrentWeatherUsecase
    implements Usecase<DataState<CurrentCityEntity>, String> {
  final IWeatherRepository _weatherRepository;
  GetCurrentWeatherUsecase(this._weatherRepository);

  @override
  Future<DataState<CurrentCityEntity>> call(String cityName) {
    return _weatherRepository.fetchCurrentWeatherData(cityName);
  }
}
