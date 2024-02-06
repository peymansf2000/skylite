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
  final CurrentCityEntity currentCityEntity;

  const HomeCompleted({required this.currentCityEntity});

  @override
  List<Object> get props => [currentCityEntity];
}

final class HomeLoading extends HomeState {}
