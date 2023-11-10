import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weatherio/core/constrains/app_colors.dart';
import 'package:weatherio/core/constrains/app_fonts.dart';
import 'package:weatherio/core/constrains/images_path.dart';
import '../../../../core/constrains/app_string.dart';

class AqiCircle extends StatelessWidget {
  const AqiCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 296,
        height: 296.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              painter: Painter(),
              foregroundPainter: ForeGround(),
              willChange: true,
            ),
            Positioned(
                top: 63.h,
                child: Text(
                  'TODAY',
                  style: AppFonts.inter18,
                )),
            Positioned(
                top: 101.5.h,
                child: SvgPicture.asset(
                  ImagesPath.clockWisePath,
                  height: 71.h,
                  width: 48,
                )),
            Positioned(
                top: 198.h,
                child: Text(
                  "AQI",
                  style: AppFonts.inter18,
                )),
            Positioned(
                top: 219.h,
                child: Text(
                  "300",
                  style: AppFonts.inter34,
                )),
            Positioned(
                left: 55,
                bottom: 10.h,
                child: Text(
                  AppString.beginAqi,
                  style: AppFonts.inter18,
                )),
            Positioned(
                bottom: 10.h,
                right: 55,
                child: Text(
                  AppString.endAqi,
                  style: AppFonts.inter18,
                ))
          ],
        ));
  }
}

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.r
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(Rect.fromCircle(center: Offset.zero, radius: 145.r),
        3 * pi / 4, 6 * pi / 4, false, paint);
//the second paint up the first one
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ForeGround extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    LinearGradient linearGradient =
        const LinearGradient(colors: AppColors.backGround);
    Rect rect = Rect.fromCircle(center: Offset.zero, radius: 145.r);
    Paint paint2 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.r
      ..strokeCap = StrokeCap.round
      ..shader = linearGradient.createShader(rect);

    canvas.drawArc(rect, 3 * pi / 4, 4 * pi / 4, false, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
