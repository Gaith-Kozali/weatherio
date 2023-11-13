import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constrains/app_colors.dart';
import '../../../../../core/constrains/app_fonts.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on_outlined,
                size: 16.spMin, color: AppColors.white),
            SizedBox(width: 15.w),
            Text(
              'Qena , Egypt',
              style: AppFonts.poppins20,
            ),
          ],
        ));
  }
}
