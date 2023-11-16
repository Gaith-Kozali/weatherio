import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weatherio/features/feauter_home/presentation/widgets/home/home_appbar.dart';
import '../../../../core/constrains/app_colors.dart';
import '../../../../core/constrains/app_fonts.dart';
import '../../../../core/constrains/global_things.dart';
import '../../../../core/constrains/images_path.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home/details_widget.dart';
import '../widgets/home/switch_widget.dart';
import '../widgets/message_state_widget.dart';
import '../widgets/weather_list.dart';
import 'collecting_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String route = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    Future<void> refresh() async {
      BlocProvider.of<HomeBloc>(context).add(GetWeatherEvent(cityName));
    }

    return BlocConsumer<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is GetWeatherState ||
            state is ErrorState ||
            state is TomoTodayState) {
          weather = state is GetWeatherState ? state.weather : weather;
          dayDisplay = state is TomoTodayState ? state.day : dayDisplay;
          return Scaffold(
            body: RefreshIndicator(
                color: AppColors.purple,
                onRefresh: refresh,
                child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Container(
                      decoration: backGroundBox,
                      height: 890.h,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const HomeAppBar(),
                            SvgPicture.asset(
                              ImagesPath.logoPath,
                              width: 226.w,
                              height: 176.h,
                            ),
                            SizedBox(height: 10.h),
                            Text('${weather[dayDisplay].temperature}°',
                                style: AppFonts.poppins30),
                            Text(
                              weather[dayDisplay].date,
                              style: AppFonts.poppins12,
                            ),
                            const DetailsWidget(),
                            const SwitchWidget(),
                            Padding(
                              padding: EdgeInsets.only(top: 31.h),
                              child: WeatherList(),
                            ),
                          ]),
                    ))),
          );
        } else if (state is WaitState) {
          return waitingWidget();
        } else if (state is NoDataAndInterState) {
          return noDataAndInternet(context, state.message);
        } else {
          return const SizedBox();
        }
      },
      listener: (context, state) {
        if (state is ErrorState) {
          errorMessage(context, state.message);
        } else if (state is GetWeatherState && state.isConnect == false) {
          noInterMessage(context);
        }
      },
    );
  }
}
