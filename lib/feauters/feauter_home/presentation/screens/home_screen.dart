import 'package:flutter/material.dart';
import 'package:weatherio/feauters/feauter_home/presentation/widgets/home_button.dart';
import '../widgets/aqi_circle.dart';
import '../widgets/weather_list.dart';
import '../widgets/weather_now.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String route = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
            Color(0XFF2E5A95),
            Color(0xFFECABFC),
          ])),
      child: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [WeatherNow(), WeatherList(), AqiCircle(), HomeButton()],
      )),
    ));
  }
}
