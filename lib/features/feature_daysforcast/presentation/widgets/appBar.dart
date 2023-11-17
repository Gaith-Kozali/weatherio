import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constrains/app_colors.dart';
import '../../../../core/constrains/app_fonts.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        IconButton(
            onPressed: () {},
            icon: Icon(
              color: AppColors.white,
              Icons.arrow_back_ios_new_outlined,
              size: 25,
            )),
        Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.white,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Qena , Egypt',
                  style:
                  AppFonts.poppins20,
                )
              ],
            ))
      ],
    );
  }
}
