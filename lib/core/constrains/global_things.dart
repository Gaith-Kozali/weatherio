import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

BoxDecoration get backGroundBox => const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
          Color(0XFF2E5A95),
          Color(0xFFECABFC),
        ]));

Widget selected(Widget ic) {
  return Container(
      width: 53.w,
      height: 53.h,
      decoration: backGroundBox.copyWith(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(22))),
      child: IconButton(onPressed: () {}, icon: ic));
}

Future<bool> checkConnection() async {
  return await InternetConnectionChecker().hasConnection;
}