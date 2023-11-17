import 'package:flutter/material.dart';
import '../../../../core/constrains/app_fonts.dart';
import '../../../../core/constrains/app_string.dart';

class TitleOfDay extends StatelessWidget {
  const TitleOfDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Text(
        AppString.daysForCast,
        style: AppFonts.poppins20
      ),
    );
  }
}
