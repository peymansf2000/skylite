import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skylite/core/params/forecast_params.dart';
import 'package:skylite/core/resources/data_state.dart';

import 'package:skylite/features/weather/domain/entities/weather_entity.dart';
import 'package:skylite/features/weather/domain/usecases/get_current_weather_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUsecase getCurrentWeatherUsecase;
  HomeBloc(this.getCurrentWeatherUsecase) : super(HomeLoading()) {
    on<HomeStarted>((event, emit) async {
      emit(HomeLoading());

      DataState<WeatherEntity> dataState =
          await getCurrentWeatherUsecase(event.params);

      if (dataState is DataSuccess) {
        emit(HomeCompleted(weatherEntity: dataState.data!));
      } else if (dataState is DataFailed) {
        emit(HomeError(message: dataState.error!));
      }
    });
  }
}
