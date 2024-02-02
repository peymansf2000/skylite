import 'package:get_it/get_it.dart';
import 'package:skylite/features/weather/data/data_source/remote/api_provider.dart';
import 'package:skylite/features/weather/data/repository/weather_repository.dart';
import 'package:skylite/features/weather/domain/repository/weather_repository.dart';
import 'package:skylite/features/weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:skylite/features/weather/presentation/bloc/home_bloc.dart';

GetIt locator = GetIt.instance;

setup() {
  locator.registerSingleton<ApiProvider>(ApiProvider());
  locator.registerSingleton<IWeatherRepository>(WeatherRepository(locator()));
  locator.registerSingleton<GetCurrentWeatherUsecase>(
      GetCurrentWeatherUsecase(locator()));
  locator.registerSingleton<HomeBloc>(HomeBloc(locator()));
}
