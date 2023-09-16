import 'package:flutter/material.dart';
import 'package:note_app/widgets/theme_widget/elevated_button_theme.dart';
import 'package:note_app/widgets/theme_widget/outlined_button_theme.dart';
import 'package:note_app/widgets/theme_widget/text_form_field_theme.dart';
import 'package:note_app/widgets/theme_widget/text_theme.dart';

import 'app_color.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      textTheme: AppTextTheme.lightTextTheme,
      elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: AppTextFormFieldTheme.lightTextInputDecorationTheme,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: AppColor.scaffoldDarkBackground,
          elevation: 4,
          splashColor: AppColor.accentColor
      ), colorScheme: ColorScheme.fromSwatch(primarySwatch: const MaterialColor(0x9993EFED, <int, Color>{
        50: Color(0x0D93EFED),
        100: Color(0x1A93EFED),
        200: Color(0x3393EFED),
        300: Color(0x4D93EFED),
        400: Color(0x6693EFED),
        500: Color(0x9993EFED),
        600: Color(0xB393EFED),
        700: Color(0xB393EFED),
        800: Color(0xCC93EFED),
        900: Color(0xE693EFED),
      },)).copyWith(background: AppColor.scaffoldBackground,brightness:Brightness.light,)
  );
  static ThemeData darkTheme = ThemeData(
      textTheme: AppTextTheme.darkTextTheme,
      elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: AppTextFormFieldTheme.darkTextInputDecorationTheme,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: AppColor.primaryColor,
          elevation: 4,
          splashColor: AppColor.accentColor
      ), colorScheme: ColorScheme.fromSwatch(primarySwatch: const MaterialColor(0x9993EFED, <int, Color>{
        50: Color(0x0D93EFED),
        100: Color(0x1A93EFED),
        200: Color(0x3393EFED),
        300: Color(0x4D93EFED),
        400: Color(0x6693EFED),
        500: Color(0x9993EFED),
        600: Color(0xB393EFED),
        700: Color(0xB393EFED),
        800: Color(0xCC93EFED),
        900: Color(0xE693EFED),
      },)).copyWith(background: AppColor.scaffoldDarkBackground,brightness: Brightness.dark,)
  );
}
