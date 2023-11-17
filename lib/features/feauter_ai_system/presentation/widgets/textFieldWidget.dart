import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constrains/app_colors.dart';
import '../../../../core/constrains/app_string.dart';

class TextWidgetField extends StatelessWidget {
  const TextWidgetField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.red,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.fieldColorTwo,
                AppColors.fieldColorOne,
              ],
            )),

        width: double.infinity,
        height: 50,
        child: TextFormField(
          decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.greyColorWithOpacity,
              ),
              hintText: AppString.searchText,
              hintStyle: TextStyle(color: AppColors.greyColorWithOpacity),
              contentPadding: EdgeInsets.all(13),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none),
        ),

// child: ,
      ),
    );
  }
}
