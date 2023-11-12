import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constrains/app_fonts.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16, bottom: 24.h),
      child: Container(
        width: 294.w,
        height: 95.h,
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: [Color(0xFF947CCD), Color(0xFF523D7F)],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8).r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/Precipitation.png",
                    width: 24.w, height: 24.h),
                Text(
                  '30% ',
                  style: AppFonts.poppins14,
                  maxLines: 1,
                ),
                Text('Precipitation',
                    style: AppFonts.poppins12
                        .copyWith(fontWeight: FontWeight.w600),
                    maxLines: 1),
              ],
            ),
            SizedBox(
              width: 25.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/Humidity.png", width: 24.w, height: 24.h),
                Text('30% ', style: AppFonts.poppins14, maxLines: 1),
                Text('Humidity',
                    style: AppFonts.poppins12
                        .copyWith(fontWeight: FontWeight.w600),
                    maxLines: 1),
              ],
            ),
            SizedBox(
              width: 25.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/wind.png", width: 24.w, height: 24.h),
                Text('9km/h', style: AppFonts.poppins14, maxLines: 1),
                Text('Wind Speed',
                    style: AppFonts.poppins12
                        .copyWith(fontWeight: FontWeight.w600),
                    maxLines: 1),
              ],
            )
          ],
        ),
      ),
    );
  }
}
