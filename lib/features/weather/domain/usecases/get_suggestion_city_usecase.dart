import 'package:skylite/core/usecases/usecase.dart';
import 'package:skylite/features/weather/data/models/geodb/suggest_city_model/datum.dart';
import 'package:skylite/features/weather/domain/repository/weather_repository.dart';

class GetSuggestionCityUsecase implements Usecase<List<Datum>, String> {
  final IWeatherRepository _weatherRepository;
  GetSuggestionCityUsecase(this._weatherRepository);

  @override
  Future<List<Datum>> call(String prefix) {
    return _weatherRepository.fetchSuggestData(prefix);
  }
}
