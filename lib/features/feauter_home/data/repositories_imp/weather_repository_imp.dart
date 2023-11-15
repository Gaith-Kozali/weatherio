import 'package:weatherio/features/feauter_home/data/data_source/get_local_weather.dart';
import 'package:weatherio/features/feauter_home/data/data_source/get_remote_weather.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class WeatherRepositoryImp extends WeatherRepository {
  WeatherRepositoryImp(
      {required this.getRemoteWeather, required this.getLocalWeather});
  GetRemoteWeather getRemoteWeather;
  GetLocalWeather getLocalWeather;
  @override
  Future<Either<String, List<Weather>>> getWeather(String city) async {
    List<Weather> weather;
    bool result = await InternetConnectionChecker().hasConnection;
    try {
      if (result == true) {
        print(
            "wifiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii $result");
        final location = await getRemoteWeather.getLatLon(city);
        weather = await getRemoteWeather.getWeather(location);
        getLocalWeather.setWeatherData(weather);
      } else {
        print(
            "lllllllllllllllllllooooooooooooooooooooooccccccccccallllleeeeeeeeee $result");
        weather = getLocalWeather.getWeatherData();
      }

      return Right(weather);
    } catch (e) {
      print("the cattttttttttttttttttttttttttttchhhhhh$e");
      return Left((e.toString()));
    }
  }
}
