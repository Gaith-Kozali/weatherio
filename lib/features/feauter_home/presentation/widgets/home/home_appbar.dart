import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherio/core/constrains/app_string.dart';
import 'package:weatherio/features/feauter_home/presentation/bloc/home_bloc.dart';
import 'package:weatherio/features/feauter_home/presentation/screens/collecting_screen.dart';
import '../../../../../core/constrains/app_colors.dart';
import '../../../../../core/constrains/app_fonts.dart';
import '../../../../../core/constrains/global_things.dart';

String cityName = "Damascus";

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                _chooseCityWidget(context);
              },
              icon: Icon(Icons.location_on_outlined,
                  size: 16.spMin, color: AppColors.white),
            ),
            SizedBox(width: 15.w),
            Text(
              '${weather[0].location.country} , ${weather[0].location.city}',
              style: AppFonts.poppins20,
            ),
          ],
        ));
  }
}

_chooseCityWidget(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isDismissible: false,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: 300.h,
        decoration: backGroundBox.copyWith(
            borderRadius:
                BorderRadius.vertical(top: const Radius.circular(30).r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppString.chooseCityTitle, style: AppFonts.poppins20W600),
            SizedBox(
              height: 10.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: SelectState(
                  onCountryChanged: (value) {},
                  onStateChanged: (value) {},
                  onCityChanged: (value) {
                    cityName = value;
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancel",
                      style: AppFonts.poppins20,
                    )),
                OutlinedButton(
                    onPressed: () {
                      BlocProvider.of<HomeBloc>(context)
                          .add(GetWeatherEvent(cityName));
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Ok",
                      style: AppFonts.poppins20,
                    ))
              ],
            )
          ],
        ),
      );
    },
  );
}
