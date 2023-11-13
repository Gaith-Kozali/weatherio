import 'package:weatherio/features/feauter_home/domain/entities/location.dart';

class Weather {
  Weather({
    required this.description,
    required this.temperature,
    required this.temperatureMax,
    required this.temperatureMin,
    required this.humidity,
    required this.windSpeed,
    required this.precipitation,
    required this.location,
    required this.date,
    required this.image,
  });
  String description;
  String temperature;
  String temperatureMin;
  String temperatureMax;
  String windSpeed;
  String humidity;
  String precipitation;
  Location location;
  String date;
  String image;

  factory Weather.fromJson(final json, Location location) {
    return Weather(
        description: json['list'][0]['weather']['description'],
        temperature: json['list'][0]['main']['temp'].toString(),
        temperatureMax: json['list'][0]['main']['temp_max'].toString(),
        temperatureMin: json['list'][0]['main']['temp_min'].toString(),
        humidity: json['list'][0]['main']['humidity'].toString(),
        image: json['list'][0]['weather']['icon'],
        windSpeed: json['list'][0]['wind']['speed'].toString(),
        date: json['list'][0]['dt_txt'],
        precipitation: json['list'][0]['pop'].toString(),
        location: location);
  }
}
