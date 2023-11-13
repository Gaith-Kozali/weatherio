import 'package:weatherio/features/feauter_home/data/data_source/get_remote_weather.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';

class WeatherRepositoryImp extends WeatherRepository {
  WeatherRepositoryImp({required this.getRemoteWeather});
  GetRemoteWeather getRemoteWeather;
  @override
  Future<Either<String, Weather>> getWeather(String city) async {
    try {
      final location = await getRemoteWeather.getLatLon(city);
      final weather = await getRemoteWeather.getWeather(location);
      print(weather);
      print(
          " ///////////////////////////    /////////////////////////// $location");
      return Right(weather);
    } catch (e) {
      print("the cattttttttttttttttttttttttttttchhhhhh$e");
      return Left((e.toString()));
    }
  }
}
