import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weatherio/core/constrains/app_colors.dart';
import 'package:weatherio/core/constrains/app_fonts.dart';
import 'package:weatherio/features/feauter_home/presentation/bloc/home_bloc.dart';
import 'package:weatherio/features/feauter_home/presentation/screens/collecting_screen.dart';
import 'package:weatherio/features/feauter_home/presentation/screens/details_screen.dart';
import '../../../../core/constrains/images_path.dart';

class WeatherList extends StatelessWidget {
  WeatherList({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // the api give me 8 weather details for each
    // 24 h and when next 3 hours come it is remove the old one
    // and i want to display only the data of this day in the list
    int count = 8 - DateTime.now().hour ~/ 3;
    return SizedBox(
      height: 198.h,
      width: 396.w,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(width: 20.w);
        },
        itemCount: count,
        itemBuilder: (context, index) {
          return index == 0
              ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(DetailsScreen.route);
                  },
                  child: Container(
                    width: 84.w,
                    height: 198.h,
                    decoration: ShapeDecoration(
                      color: AppColors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40).r,
                      ),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${weather[index + dayDisplay].temperature}°C',
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
                            "Now",
                            style: AppFonts.poppins20,
                            maxLines: 1,
                          )
                        ]),
                  ))
              : Container(
                  width: 84.w,
                  height: 198.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF836CAA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40).r,
                    ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${weather[index + dayDisplay].temperature}°C',
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
                          weather[index + dayDisplay].time,
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
