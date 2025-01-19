import 'package:flutter/material.dart';
import 'package:note_app/widgets/theme_widget/elevated_button_theme.dart';
import 'package:note_app/widgets/theme_widget/outlined_button_theme.dart';
import 'package:note_app/widgets/theme_widget/text_form_field_theme.dart';
import 'package:note_app/widgets/theme_widget/text_theme.dart';

import 'app_color.dart';

class AppTheme {
  AppTheme._();

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: AppTextFormFieldTheme.lightTextInputDecorationTheme,
    scaffoldBackgroundColor: const Color(0xFFF5E8DD),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: AppColor.scaffoldDarkBackground,
      elevation: 4,
      splashColor: AppColor.accentColor,
    ),
    colorScheme: const ColorScheme(
      primary: Color(0xFFF5E8DD), // Primary scaffold background color
      onPrimary: Color(0xFF45465B), // Text color on primary
      secondary: Color(0xFF4262C5), // Accent color
      onSecondary: Color(0xFF45465B),
      error: Colors.redAccent,
      onError: Colors.white,
      background: Color(0xFFF5E8DD),
      onBackground: Colors.black,
      surface: Color(0xFFF5E8DD),
      onSurface: Color(0xFF45465B),
      brightness: Brightness.light,
    ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    textTheme: AppTextTheme.darkTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: AppTextFormFieldTheme.darkTextInputDecorationTheme,
    scaffoldBackgroundColor: const Color(0xFF42476D),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: AppColor.primaryColor,
      elevation: 4,
      splashColor: AppColor.accentColor,
    ),
    colorScheme: const ColorScheme(
      primary: Color(0xFF42476D), // Primary scaffold background color
      onPrimary: Color(0xFFD7D7D7), // Text color on primary
      secondary: Color(0xFF4262C5), // Accent color
      onSecondary: Color(0xFFD7D7D7),
      error: Colors.redAccent,
      onError: Colors.black,
      background: Color(0xFF42476D),
      onBackground: Colors.white,
      surface: Color(0xFF42476D),
      onSurface: Color(0xFFD7D7D7),
      brightness: Brightness.dark,
    ),
  );
}
