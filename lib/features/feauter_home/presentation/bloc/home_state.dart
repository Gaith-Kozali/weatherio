part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetWeatherState extends HomeState {
  GetWeatherState(this.weather);
  List<Weather> weather;
}

class WaitState extends HomeState {}

class ErrorState extends HomeState {
  ErrorState(this.message,);
  String message;
}
