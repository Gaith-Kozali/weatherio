import 'dart:convert';
import 'package:weatherio/features/feauter_home/domain/entities/weather.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetLocalWeather {
  void setWeatherData(List<Weather> data);
  List<Weather> getWeatherData();
}

class GetLocalWeatherImp implements GetLocalWeather {
  GetLocalWeatherImp({required this.sharedPreferences});
  SharedPreferences sharedPreferences;
  @override
  void setWeatherData(List<Weather> data) async {
    List<String> jsonString = data.map((e) => json.encode(e)).toList();
    await sharedPreferences.setStringList("weather_data", jsonString);
    print(
        "sssssssssssssssseeeet weather in locccccccccccccaaaalllll $jsonString");
  }

  @override
  List<Weather> getWeatherData() {
    List<Weather>? weather = [];
    if (sharedPreferences.containsKey("weather_data")) {
      List<String>? data = sharedPreferences.getStringList("weather_data");
      weather =
          data!.map((e) => Weather.fromJsonCachedData(json.decode(e))).toList();
      print(
          "***************************************************************************  ${weather} ddddddddddddddddddddddaaaaa${data}");
      return weather;
    } else {
      return weather;
    }
  }
}
