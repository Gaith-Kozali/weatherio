import 'package:dartz/dartz.dart';
import 'package:weatherio/features/feauter_home/domain/repositories/weather_repository.dart';
import '../entities/weather.dart';

class GetWeatherUseCase {
  GetWeatherUseCase({required this.weatherRepository});
  WeatherRepository weatherRepository;
  Future<Either<String, Weather>> call(String city) async {
    final weather = await weatherRepository.getWeather(city);
    print("in the GetWeatherUseCase $weather");
    return weather;
  }
}
