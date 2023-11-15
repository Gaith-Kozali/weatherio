import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constrains/global_things.dart';
import '../widgets/details/aqi_circle.dart';
import '../widgets/details/details_button.dart';
import '../widgets/weather_list.dart';
import '../widgets/details/weather_now.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  static const String route = "DetailsScreen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Container(
        decoration: backGroundBox,
        height: 926.h,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 30.h,
            ),
            const WeatherNow(),
            const WeatherList(),
            const AqiCircle(),
            const DetailsButton(),
            SizedBox(
              height: 20.h,
            )
          ],
        )),
      ),
    ));
  }
}
