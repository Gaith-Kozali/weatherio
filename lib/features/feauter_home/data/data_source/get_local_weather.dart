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
    final jsonString = jsonEncode(data);
    await sharedPreferences.setString("weather_data", jsonString);
    print("sssssssssssssssseeeet weather in locccccccccccccaaaalllll");
  }

  @override
  List<Weather> getWeatherData() {
    List<Weather> weather = [];
    if (sharedPreferences.containsKey("weather_data")) {
      String? data = sharedPreferences.getString("weather_data");
      weather = jsonDecode(data!);
      print("llllllllllllllllllllllloooooooocaallllllllllllllocal${weather}");
      return weather;
    } else {
      return weather;
    }
  }
}
