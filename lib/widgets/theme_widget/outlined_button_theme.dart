import 'package:flutter/material.dart';
import 'package:note_app/core/app_color.dart';

class AppOutlinedButtonTheme{
  AppOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme=OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: AppColor.scaffoldDarkBackground,
      side: const BorderSide(color: AppColor.scaffoldDarkBackground),
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 16),

    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: AppColor.primaryColor,
      side: const BorderSide(color: AppColor.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 16),

    ),
  );
}