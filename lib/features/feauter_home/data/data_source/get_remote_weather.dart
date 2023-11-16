import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/location.dart';
import '../../domain/entities/weather.dart';

abstract class GetRemoteWeather {
  Future<List<Weather>> getWeather(Location location);
  Future<Location> getLatLon(String city);
}

class GetRemoteWeatherImp implements GetRemoteWeather {
  // website of api : https://openweathermap.org/api/geocoding-api
  @override
  Future<Location> getLatLon(String city) async {
    String api =
        "http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=1&appid=1189e7851426f32fc69c64b39163e604";
    final response = await http.get(Uri.parse(api));
    final data = json.decode(response.body);
    // print(data);
    return Location.fromJson(data);
  }

  // website of api : https://openweathermap.org/forecast5
  @override
  Future<List<Weather>> getWeather(Location location) async {
    String api =
        "https://api.openweathermap.org/data/2.5/forecast?lat=${location.lat}&lon=${location.lon}&appid=1189e7851426f32fc69c64b39163e604";
    final response = await http.get(Uri.parse(api));
    final data = json.decode(response.body);

    print("the boddddddddddddddddddyyyy  ${response.body}");

    List<Weather> weather =
        List.generate(24, (index) => Weather.fromJson(data, location, index));
    print(
        "weather listtttttttttttttttttttttttttttttttttt  from remote data $weather");
    return weather;
  }
}
