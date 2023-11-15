import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherio/features/feauter_home/data/data_source/get_local_weather.dart';
import 'package:weatherio/features/feauter_home/data/data_source/get_remote_weather.dart';
import 'package:weatherio/features/feauter_home/data/repositories_imp/weather_repository_imp.dart';
import 'package:weatherio/features/feauter_home/domain/repositories/weather_repository.dart';
import 'package:weatherio/features/feauter_home/domain/use_cases/get_weather_usecase.dart';
import 'package:weatherio/features/feauter_home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

class InitializeHome {
  Future<void> injection() async {
    // initialize object of SharedPreferences cached data if no internet
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // initialize object of homeBloc
    sl.registerFactory(() => HomeBloc(getWeatherUseCase: sl()));

    // initialize object of GetWeatherUseCase
    sl.registerLazySingleton(
        () => GetWeatherUseCase(weatherRepository: sl()));

    // initialize object of repository
    sl.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImp(
        getRemoteWeather: sl(), getLocalWeather: sl()));

    // initialize object of data source
    sl.registerLazySingleton<GetRemoteWeather>(() => GetRemoteWeatherImp());
    sl.registerLazySingleton<GetLocalWeather>(
        () => GetLocalWeatherImp(sharedPreferences: sharedPreferences));
  }
}
