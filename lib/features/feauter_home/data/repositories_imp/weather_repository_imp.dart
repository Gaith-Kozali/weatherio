import 'package:weatherio/features/feauter_home/data/data_source/get_local_weather.dart';
import 'package:weatherio/features/feauter_home/data/data_source/get_remote_weather.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/constrains/global_things.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';

class WeatherRepositoryImp extends WeatherRepository {
  WeatherRepositoryImp(
      {required this.getRemoteWeather, required this.getLocalWeather});
  GetRemoteWeather getRemoteWeather;
  GetLocalWeather getLocalWeather;
  @override
  Future<Either<String, List<Weather>>> getWeather(String city) async {
    List<Weather> weather;

    try {
      if (await checkConnection()) {
        final location = await getRemoteWeather.getLatLon(city);
        weather = await getRemoteWeather.getWeather(location);
        getLocalWeather.setWeatherData(weather);
      } else {
        weather = getLocalWeather.getWeatherData();
      }

      return Right(weather);
    } catch (e) {
      print("the cattttttttttttttttttttttttttttchhhhhh$e");
      return Left((e.toString()));
    }
  }
}
