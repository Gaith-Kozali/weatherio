import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherio/core/constrains/app_colors.dart';

class AppFonts {
  static TextStyle poppins12 = GoogleFonts.poppins(
    color: AppColors.white,
    fontSize: 12.spMin,
    fontWeight: FontWeight.w500,
  );

  static TextStyle poppins20 = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 20.spMin,
    fontWeight: FontWeight.w500,
  );

  static TextStyle poppins30 = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 30.spMin,
    fontWeight: FontWeight.w700,
  );
  static TextStyle inter18 = GoogleFonts.inter(
    color: Colors.white,
    fontSize: 18.spMin,
    fontWeight: FontWeight.w500,
  );
  static TextStyle inter34 = GoogleFonts.inter(
    color: Colors.white,
    fontSize: 34.spMin,
    fontWeight: FontWeight.w700,
  );
}
