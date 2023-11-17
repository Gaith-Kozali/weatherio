import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherio/features/feauter_home/presentation/widgets/weather_list.dart';
import '../../../../core/constrains/app_colors.dart';
import '../../../feauter_ai_system/presentation/widgets/appBar.dart';
import '../../../feauter_home/presentation/bloc/home_bloc.dart';
import '../widgets/air_quality.dart';
import '../widgets/sunrise_and_uvIndex.dart';

class HomeDayForCast extends StatelessWidget {
  const HomeDayForCast({Key? key}) : super(key: key);
  static String route = "HomeDayForCast";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is GetWeatherState ||
            state is TomoTodayState ||
            state is ErrorState) {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [AppColors.primaryTwo, AppColors.primaryOne],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBarWidget(),
                    SizedBox(
                      height: 30.h,
                    ),
                    const WeatherList(),
                    SizedBox(
                      height: 10.h,
                    ),
                    const AirQuality(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SunRiseAndUvIndex(
                            one: 'SUNRISE',
                            two: '5:28 AM',
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          SunRiseAndUvIndex(
                            one: 'UV INDEX',
                            two: '4',
                            three: 'Moderate',
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
