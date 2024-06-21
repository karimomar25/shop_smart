import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_smart/consts/app_colors.dart';

class Styles {
  static ThemeData themeData(
      {required bool IsDarkTheme, required BuildContext context}) {
    return ThemeData(
        scaffoldBackgroundColor: IsDarkTheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightScaffoldColor,
        cardColor: IsDarkTheme
            ? Color.fromARGB(255, 13, 6, 37)
            : AppColors.lightCardColor,
        brightness: IsDarkTheme ? Brightness.dark : Brightness.light);
  }
}
