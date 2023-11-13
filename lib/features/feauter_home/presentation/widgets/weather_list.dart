import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weatherio/core/constrains/app_fonts.dart';
import '../../../../core/constrains/images_path.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 198.h,
      width: 396.w,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(width: 20.w);
        },
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 84.w,
            height: 198.h,
            decoration: ShapeDecoration(
              color: const Color(0xFF836CAA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40).r,
              ),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                '21°C',
                style: AppFonts.poppins20,
                maxLines: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16).h,
                child: SvgPicture.asset(
                  ImagesPath.logoPath,
                  height: 53.h,
                  width: 53.w,
                ),
              ),
              Text(
                '6 AM',
                style: AppFonts.poppins20,
                maxLines: 1,
              )
            ]),
          );
        },
      ),
    );
  }
}
