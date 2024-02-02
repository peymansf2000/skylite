import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skylite/core/resources/data_state.dart';
import 'package:skylite/features/weather/domain/entities/current_city_entity.dart';
import 'package:skylite/features/weather/domain/usecases/get_current_weather_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUsecase getCurrentWeatherUsecase;
  HomeBloc(this.getCurrentWeatherUsecase) : super(HomeLoading()) {
    on<HomeStarted>((event, emit) async {
      emit(HomeLoading());

      DataState<CurrentCityEntity> dataState =
          await getCurrentWeatherUsecase(event.cityName);

      if (dataState is DataSuccess) {
        emit(HomeCompleted(currentCityEntity: dataState.data!));
      } else if (dataState is DataFailed) {
        emit(HomeError(message: dataState.error!));
      }
    });
  }
}
