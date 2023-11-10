import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherio/core/constrains/app_colors.dart';
import 'package:weatherio/core/constrains/images_path.dart';
import '../../../../core/constrains/app_string.dart';
import '../widgets/splash_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Alignment alignment = Alignment.centerLeft;
  double visible = 0;
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        setState(() {
          alignment = Alignment.center;
          visible = 1;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: AppColors.backGround)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: visible,
              duration: const Duration(seconds: 5),
              curve: Curves.bounceOut,
              child: SvgPicture.asset(ImagesPath.logoPath,
                  height: 397.h, width: 397.w),
            ),
            AnimatedAlign(
              alignment: alignment,
              duration: const Duration(seconds: 5),
              curve: Curves.bounceOut,
              child: Text(
                AppString.logoText,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 48.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 119.h,
            ),
            const SplashButton(),
          ],
        ),
      ),
    );
  }
}
