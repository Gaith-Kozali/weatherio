import 'package:flutter/material.dart';

import '../../../../core/constrains/app_colors.dart';
import '../../../../core/constrains/app_fonts.dart';
import '../../../../core/constrains/app_string.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.white,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: AppColors.white,
              ),
              Text(
                "elklf ",
                style: AppFonts.poppins18,
              )
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
