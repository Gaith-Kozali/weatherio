import 'package:dartz/dartz.dart';
import 'package:weatherio/features/feauter_home/domain/repositories/weather_repository.dart';
import '../entities/weather.dart';

class GetWeatherUseCase {
  GetWeatherUseCase({required this.weatherRepository});
  WeatherRepository weatherRepository;
  Future<Either<String, List<Weather>>> call(String city) async {
    final data = await weatherRepository.getWeather(city);
    print("in the GetWeatherUseCase $data");
    return data;
  }
}
