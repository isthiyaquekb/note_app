import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/core/app_color.dart';

class AppTextFormFieldTheme {
  AppTextFormFieldTheme._();

  static InputDecorationTheme lightTextInputDecorationTheme = InputDecorationTheme(
    labelStyle: GoogleFonts.quantico(color: AppColor.hintTextColor,fontSize: 14,fontWeight: FontWeight.w400),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(color: AppColor.borderColor,width: 1),
    ),
    floatingLabelStyle: const TextStyle(color: AppColor.hintTextColor),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
          color: AppColor.borderColor, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(color: AppColor.borderColor),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
          color: AppColor.borderColor, width: 1),
    ),
  );
  static InputDecorationTheme darkTextInputDecorationTheme = InputDecorationTheme(
    labelStyle: GoogleFonts.quantico(color: AppColor.white,fontSize: 14,fontWeight: FontWeight.w400),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(color: AppColor.white,width: 1),
    ),
    floatingLabelStyle: const TextStyle(color: AppColor.white),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
          color: AppColor.white, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(color: AppColor.white),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
          color: AppColor.borderColor, width: 1),
    ),
  );
}
