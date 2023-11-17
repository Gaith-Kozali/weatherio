import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constrains/app_colors.dart';
import '../../../../core/constrains/app_fonts.dart';
import '../../../../core/constrains/images_path.dart';
import '../../../feature_daysforcast/presentation/widgets/appBar.dart';
import '../../../feauter_ai_system/presentation/widgets/textFieldWidget.dart';

class SearchScreens extends StatelessWidget {
  const SearchScreens({Key? key}) : super(key: key);

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
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      child: Container(
                        //color: Colors.blue,
                        //width: double.infinity,
                        height: 110.h,

                        child: Stack(
                          children: [
                            Positioned(
                              top: 30.h,
                              child: Container(
                                width: 300.w,
                                height: 80.h,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromRGBO(236, 181, 252, 0.3),
                                        Color.fromRGBO(61, 22, 128, 0.7),
                                      ],
                                      begin: Alignment(0.9, 14),
                                    ),
                                    borderRadius: BorderRadius.circular(15.r)),
                                child: Center(
                                  child: ListTile(
                                    title: Text(
                                      'Banha',
                                      style: AppFonts.poppins20W600,
                                    ),
                                    subtitle: Text(
                                      'cloudy',
                                      style: AppFonts.poppins14
                                          .copyWith(color: AppColors.greyColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 0.3.h,
                                left: 210.w,
                                child: Image.asset(
                                  ImagesPath.rainingImage,
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  decoration() {
    return BoxDecoration(
        color: Colors.red,
        gradient: LinearGradient(
            colors: [AppColors.primaryTwo, AppColors.primaryOne],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight));
  }
}
