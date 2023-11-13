import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherio/core/constrains/app_colors.dart';
import 'package:weatherio/core/constrains/app_fonts.dart';
import 'package:weatherio/features/feauter_home/presentation/screens/collecting_screen.dart';
import '../../core/constrains/app_string.dart';

class SplashButton extends StatelessWidget {
  const SplashButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16).r)),
        onPressed: () {
          Navigator.pushReplacementNamed(context, CollectingScreen.route);
        },
        child: Container(
          width: 214.w,
          height: 60.h,
          decoration: _decoration,
          child: Center(
            child: Text(AppString.splashButton, style: AppFonts.poppins20),
          ),
        ));
  }
}

Decoration get _decoration => BoxDecoration(
    gradient:
        const LinearGradient(colors: AppColors.backGround),
    borderRadius: BorderRadius.circular(16).r);
