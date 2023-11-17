import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constrains/app_colors.dart';
import '../../../../core/constrains/app_fonts.dart';
import '../../../../core/constrains/images_path.dart';

class SunRiseAndUvIndex extends StatelessWidget {
  String? one;
  String? two;
  String? three;
  SunRiseAndUvIndex({this.one, this.two, this.three, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 160,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [AppColors.sunriseColorTwo, AppColors.sunriseColorOne],
              end: Alignment(0, 0.5)),
          borderRadius: BorderRadius.circular(20.r)),
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(ImagesPath.sunImage),
            minLeadingWidth: 0,
            title: Text(
              one == null ? '' : one!,
              style: AppFonts.poppins16,
            ),
          ),
          Text(
            two == null ? '' : two!,
            style: AppFonts.poppins25,
          ),
          Text(
            three == null ? '' : three!,
            style: AppFonts.poppins25,
          ),
        ],
      ),
    );
  }
}
