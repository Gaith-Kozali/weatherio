import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherio/features/feauter_home/presentation/bloc/home_bloc.dart';
import 'package:weatherio/features/feauter_home/presentation/screens/home_screen.dart';
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
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is GetWeatherState ||
            state is TomoTodayState ||
            state is ErrorState) {
          return SafeArea(
              child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
            body: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Container(
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
                      WeatherList(),
                      SizedBox(
                        height: 20.h,
                      ),
                      const AqiCircle(),
                      const DetailsButton(),
                      SizedBox(
                        height: 10.h,
                      )
                    ],
                  )),
                )),
          ));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
