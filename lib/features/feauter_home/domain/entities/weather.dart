import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:weatherio/features/feauter_home/domain/entities/location.dart';

class Weather {
  Weather(
      {required this.description,
      required this.temperature,
      required this.temperatureMax,
      required this.temperatureMin,
      required this.humidity,
      required this.windSpeed,
      required this.precipitation,
      required this.date,
      required this.time,
      required this.image,
      required this.location});
  String description;
  String temperature;
  String temperatureMin;
  String temperatureMax;
  String windSpeed;
  String humidity;
  String precipitation;
  String date;
  String time;
  String image;
  Location location;

  static String kelvinToCelsius(double temp) {
    return (temp - 273.15).round().toString();
  }

  static (String, String) format(String d) {
    DateTime date = DateTime.parse(d);
    String sDate = DateFormat('EEE, M/d/y').format(date).toString();
    String time = DateFormat('h aa').format(date).toString();
    print("////////////////////////////////////////$sDate   $time");
    return (time, sDate);
  }

  factory Weather.fromJson(final json, Location location, int index) {
    final (time, date) = format(json['list'][index]['dt_txt']);
    return Weather(
        description: json['list'][index]['weather'][0]['description'],
        temperature: kelvinToCelsius(json['list'][index]['main']['temp']),
        temperatureMax:
            kelvinToCelsius(json['list'][index]['main']['temp_max']),
        temperatureMin:
            kelvinToCelsius(json['list'][index]['main']['temp_min']),
        humidity: json['list'][index]['main']['humidity'].toString(),
        image: json['list'][index]['weather'][0]['icon'],
        windSpeed: json['list'][index]['wind']['speed'].toString(),
        date: date,
        time: time,
        precipitation: json['list'][index]['pop'].toString(),
        location: location);
  }

  factory Weather.fromJsonForCached(Map<String, dynamic> json, int index) {
    return Weather(
      description: json['description'][index],
      temperature: json['temperature'][index],
      temperatureMin: json['temperatureMin'][index],
      temperatureMax: json['temperatureMax'][index],
      windSpeed: json['windSpeed'][index],
      humidity: json['humidity'][index],
      precipitation: json['precipitation'][index],
      date: json['date'][index],
      time: json['time'][index],
      image: json['image'][index],
      location: Location.fromJson(json['location'][index]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'temperature': temperature,
      'temperatureMin': temperatureMin,
      'temperatureMax': temperatureMax,
      'windSpeed': windSpeed,
      'humidity': humidity,
      'precipitation': precipitation,
      'date': date,
      'time': time,
      'image': image,
      'location': location.toJson()
    };
  }
}
