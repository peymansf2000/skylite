import 'package:skylite/core/params/forecast_params.dart';
import 'package:skylite/core/resources/data_state.dart';
import 'package:skylite/core/usecases/usecase.dart';
import 'package:skylite/features/weather/domain/entities/weather_entity.dart';
import 'package:skylite/features/weather/domain/repository/weather_repository.dart';

class GetCurrentWeatherUsecase
    implements Usecase<DataState<WeatherEntity>, SuggestionParams> {
  final IWeatherRepository _weatherRepository;
  GetCurrentWeatherUsecase(this._weatherRepository);

  @override
  Future<DataState<WeatherEntity>> call(SuggestionParams params) {
    return _weatherRepository.fetchWeatherData(params);
  }
}
