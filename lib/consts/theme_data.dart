import 'package:flutter/material.dart';
import 'package:shop_smart/consts/app_colors.dart';

class Styles {
  static ThemeData themeData(
      // ignore: non_constant_identifier_names
      {required bool IsDarkTheme,
      required BuildContext context}) {
    return ThemeData(
        scaffoldBackgroundColor: IsDarkTheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightScaffoldColor,
        cardColor: IsDarkTheme
            ? const Color.fromARGB(255, 13, 6, 37)
            : AppColors.lightCardColor,
        brightness: IsDarkTheme ? Brightness.dark : Brightness.light,
        appBarTheme: AppBarTheme(
            backgroundColor: IsDarkTheme
                ? AppColors.darkScaffoldColor
                : AppColors.lightScaffoldColor,
            elevation: 0));
  }
}
