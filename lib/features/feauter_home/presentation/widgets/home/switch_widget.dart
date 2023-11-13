import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constrains/app_colors.dart';
import '../../../../../core/constrains/app_fonts.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({Key? key}) : super(key: key);

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 292.w,
      height: 61,
      decoration: BoxDecoration(
          color: const Color(0xFF836CAA),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 122.w,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
                child: Text(
              'Today',
              style: AppFonts.poppins20W600.copyWith(color: AppColors.purple),
            )),
          ),
          Text(
            'Tomorrow',
            style: AppFonts.poppins20W600,
          )
        ],
      ),
    );
  }
}
