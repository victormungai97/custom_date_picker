// lib/constants/src/themes.dart

import 'package:custom_date_picker/constants/src/colors.dart';
import 'package:flutter/material.dart';

/// Define the various themes used in the app

class AppThemes {
  /// Theme for the application
  static final ThemeData appTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.iconColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.logoColor,
      selectedIconTheme: IconThemeData(color: AppColors.logoColor),
    ),
    primaryColor: AppColors.iconColor,
    canvasColor: AppColors.canvasColor,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: AppColors.titleColor, fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: 18),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: 'Roboto',
      ),
      headline1: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
    ),
    fontFamily: 'Roboto',
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(fontFamily: 'Roboto'),
      labelStyle: TextStyle(fontFamily: 'Roboto'),
    ),
    //Colors for Category Card
    cardColor: Colors.white,
    dividerColor: Colors.grey[300],
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.iconColor,
      selectionColor: AppColors.iconColor,
      selectionHandleColor: AppColors.iconColor,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.iconColor,
      error: AppColors.errorColor,
      brightness: Brightness.light,
    ),
  );
}
