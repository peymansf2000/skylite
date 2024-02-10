part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});
}

final class HomeCompleted extends HomeState {
  final WeatherEntity weatherEntity;

  const HomeCompleted({required this.weatherEntity});

  @override
  List<Object> get props => [weatherEntity];
}

final class HomeLoading extends HomeState {}
