import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weatherio/core/constrains/app_colors.dart';
import 'package:weatherio/features/feauter_home/presentation/screens/collecting_screen.dart';
import '../../../../../core/constrains/app_fonts.dart';
import '../../../../../core/constrains/images_path.dart';

class WeatherNow extends StatelessWidget {
  const WeatherNow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        width: 396.w,
        height: 143.h,
        decoration: _decoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${weather[0].temperature}°',
                  style: AppFonts.poppins30,
                  maxLines: 1,
                ),
                Text(
                  '${weather[0].time} , ${weather[0].date}',
                  style: AppFonts.poppins12,
                  maxLines: 1,
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        size: 16.spMin, color: AppColors.white),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      '${weather[0].location.country} , ${weather[0].location.city}',
                      style: AppFonts.poppins12,
                      maxLines: 1,
                    )
                  ],
                ),
              ],
            ),
            SvgPicture.asset(
              ImagesPath.logoPath,
              width: 199.w,
              height: 143.h,
              fit: BoxFit.cover,
            )
          ],
        ));
  }
}

Decoration get _decoration => ShapeDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: AppColors.backGround,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          const Radius.circular(40).r,
        ).copyWith(bottomLeft: const Radius.circular(20).r),
      ),
    );
