import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constrains/app_colors.dart';
import '../../../../core/constrains/app_fonts.dart';
import '../../../../core/constrains/app_string.dart';
import '../../../../core/constrains/images_path.dart';
import '../../../feature_daysforcast/presentation/widgets/appBar.dart';
import '../widgets/textFieldWidget.dart';


class AiSystemScreen extends StatelessWidget {
  const AiSystemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        height: double.infinity,
        width: double.infinity,
        decoration: decoration(),
        child: SafeArea(
          child: Column(
            children: [
              const AppBarWidget(),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: const TextWidgetField()),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Image.asset(ImagesPath.botImage),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    AppString.talkAboutAiBot,
                    style: AppFonts.poppins20W600,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(
                    flex: 2,
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  decoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
            colors: [AppColors.primaryTwo, AppColors.primaryOne],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight));
  }
}
