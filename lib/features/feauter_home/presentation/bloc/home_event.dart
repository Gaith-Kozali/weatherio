part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetWeatherEvent extends HomeEvent {
  GetWeatherEvent(this.city);
  String city;
}
// to switch weather to now and tomorrow using switch widget
class TomoTodayEvent extends HomeEvent {
  TomoTodayEvent(this.day);
  int day;
}
