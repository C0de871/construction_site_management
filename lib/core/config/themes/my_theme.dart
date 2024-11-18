import 'package:flutter/material.dart';
import '../Colors/app_colors.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: AppColors.searchFieldBorderColor,
          fontWeight: FontWeight.normal,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.searchFieldBorderColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.searchFieldBorderColor,
          ),
        ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: AppColors.iconColor,
      ),
      dividerTheme: DividerThemeData(
        space: 0,
        color: AppColors.dividerColor,
      ),
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryColor,
        surface: AppColors.surfaceColor,
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: AppColors.drawerColor,
        // backgroundColor: Colors.red,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.zero, // No rounding at the top right
            bottomRight: Radius.zero, // No rounding at the bottom right
          ),
        ),
      ));

  //for future release:
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}
