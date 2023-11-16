part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetWeatherState extends HomeState {
  GetWeatherState(this.weather, this.isConnect);
  List<Weather> weather;
  bool isConnect;
}

class WaitState extends HomeState {}

class ErrorState extends HomeState {
  ErrorState(
    this.message,
  );
  String message;
}

class NoDataAndInterState extends HomeState{
  NoDataAndInterState(this.message);
  String message ;
}
class TomoTodayState extends HomeState{
  TomoTodayState(this.day);
  int day;
}