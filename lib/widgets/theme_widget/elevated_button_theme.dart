import 'package:flutter/material.dart';
import 'package:note_app/core/app_color.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: AppColor.primaryColor,
      backgroundColor: AppColor.scaffoldDarkBackground,
      side: const BorderSide(color: AppColor.scaffoldDarkBackground),
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 16),
    )
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          foregroundColor: AppColor.scaffoldDarkBackground,
          backgroundColor: AppColor.primaryColor,
          side: const BorderSide(color: AppColor.primaryColor),
          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 16),
      )
  );
}
