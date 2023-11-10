import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weatherio/core/constrains/app_colors.dart';
import '../../../../core/constrains/app_fonts.dart';
import '../../../../core/constrains/images_path.dart';

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
                Text('22°', style: AppFonts.poppins30),
                Text('Friday, 3 NOV 2023| 10:00', style: AppFonts.poppins12),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        size: 16.spMin, color: AppColors.white),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      'Qena , Egypt',
                      style: AppFonts.poppins12,
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
