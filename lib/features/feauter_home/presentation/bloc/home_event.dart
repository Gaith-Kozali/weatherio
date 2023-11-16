part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetWeatherEvent extends HomeEvent {
  GetWeatherEvent(this.city);
  String city;
}


