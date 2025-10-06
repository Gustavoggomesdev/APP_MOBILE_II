import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primary = Color(0xFF07617D);
  static const secondary = Color(0xFFF9A828);
  static const text = Color(0xFF2E383F);
  static const background = Color(0xFFECECEB);
  static const error = Color(0xFFFF0000);
}

class AppTypography {
  static final h1 = GoogleFonts.montserrat(
      fontWeight: FontWeight.w800, fontSize: 32, color: AppColors.text);
  static final h2 = GoogleFonts.montserrat(
      fontWeight: FontWeight.w700, fontSize: 24, color: AppColors.text);
  static final h3 = GoogleFonts.montserrat(
      fontWeight: FontWeight.w600, fontSize: 18, color: AppColors.text);
  static final para = GoogleFonts.montserrat(
      fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.text);
  static final small = GoogleFonts.montserrat(
      fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.text);
}

class AppShadows {
  static const primary = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.01),
    offset: Offset(0, 4),
    blurRadius: 30,
    spreadRadius: 0,
  );

  static const secondary = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.08),
    offset: Offset(0, 4),
    blurRadius: 20,
    spreadRadius: 0,
  );
}
