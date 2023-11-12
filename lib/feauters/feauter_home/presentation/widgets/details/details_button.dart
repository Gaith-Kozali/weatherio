import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherio/core/constrains/app_colors.dart';
import 'package:weatherio/core/constrains/app_fonts.dart';
import '../../../../../core/constrains/app_string.dart';

class DetailsButton extends StatelessWidget {
  const DetailsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20).r)),
        onPressed: () {},
        child: Container(
          width: 279.w,
          height: 58.h,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: AppColors.backGround),
              borderRadius: BorderRadius.circular(20).r),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Text(
                  AppString.homeButtonText,
                  style: AppFonts.poppins20,
                  maxLines: 1,
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white,
                  size: 22.spMin,
                )
              ]),
        ));
  }
}
