import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weatherio/features/feauter_home/presentation/widgets/home/home_appbar.dart';
import '../../../../core/constrains/app_fonts.dart';
import '../../../../core/constrains/global_things.dart';
import '../../../../core/constrains/images_path.dart';
import '../widgets/home/details_widget.dart';
import '../widgets/home/switch_widget.dart';
import '../widgets/weather_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String route = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backGroundBox,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const HomeAppBar(),
          SvgPicture.asset(
            ImagesPath.logoPath,
            width: 226.w,
            height: 176.h,
          ),
          SizedBox(height: 10.h),
          Text('22°', style: AppFonts.poppins30),
          Text(
            'Friday, 3 NOV 2023| 10:00',
            style: AppFonts.poppins12,
          ),
          const DetailsWidget(),
          const SwitchWidget(),
          Padding(
            padding: EdgeInsets.only(top: 31.h),
            child: const WeatherList(),
          ),
        ]),
      ),
    );
  }
}
