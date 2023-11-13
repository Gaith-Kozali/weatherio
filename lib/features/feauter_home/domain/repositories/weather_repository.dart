import 'package:dartz/dartz.dart';
import 'package:weatherio/features/feauter_home/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<String, Weather>> getWeather(String city);
}
