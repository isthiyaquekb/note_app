import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/core/app_color.dart';

class AppTextTheme {
  AppTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.lato(
        color: Colors.black87,
        fontSize: 34,
        fontWeight: FontWeight.w700
    ),
    displayMedium: GoogleFonts.lato(
        color: Colors.black87,
        fontSize: 24,
        fontWeight: FontWeight.w700
    ),
    titleMedium: GoogleFonts.lato(
        color: Colors.black87,
        fontSize: 14,
        fontWeight: FontWeight.w400
    ),
    titleLarge: GoogleFonts.lato(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.w400
    ),
    labelLarge: GoogleFonts.lato(
      color: AppColor.white,
      fontSize: 16,
      fontWeight: FontWeight.w600
    ),
    bodyLarge: GoogleFonts.lato(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.normal
    ),
    bodyMedium: GoogleFonts.lato(
        color: Colors.black87,
        fontSize: 14,
        fontWeight: FontWeight.normal
    ),
    bodySmall: GoogleFonts.lato(
        color: Colors.black87,
        fontSize: 14,
        fontWeight: FontWeight.normal
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.w800
    ),
    displayMedium: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w700
    ),
    titleLarge: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400
    ),
    titleMedium: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400
    ),
    labelLarge: GoogleFonts.lato(
        color: AppColor.black,
        fontSize: 16,
        fontWeight: FontWeight.w600
    ),
    bodyMedium: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.normal
    ),
    bodySmall: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.normal
    ),
  );
}