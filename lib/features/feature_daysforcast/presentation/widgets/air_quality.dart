import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constrains/app_colors.dart';
import '../../../../core/constrains/app_fonts.dart';

class AirQuality extends StatelessWidget {
  const AirQuality({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20),
          width: double.infinity,
          height: 210,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              gradient: const LinearGradient(colors: [
                AppColors.foreCastDayColorTwo,
                AppColors.foreCastDayColorOne
              ], begin: Alignment.topLeft, end: Alignment(0, 0.3))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('AIR QUALITY', style: AppFonts.poppins20W600),
              SizedBox(
                height: 20,
              ),
              Text('3-Low Health Risk', style: AppFonts.poppins20),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: double.infinity,
                  height: 5,
                  color: AppColors.foreCastDayColorTwo),
              SizedBox(height: 10),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('See More', style: AppFonts.poppins20),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
