// lib/constants/src/colors.dart

import 'package:flutter/material.dart';

/// Define the various colors used in the app

class AppColors {
  /// Logo color for the app
  static const logoColor = Color(0xff1DA1F2);

  /// Color used in icons
  static const iconColor = Color(0xff1DA1F2);

  /// Color to signify errors
  static const errorColor = Color.fromARGB(255, 255, 50, 10);

  /// Background color for major parts of the app (toolbars, tab bars, etc)
  /// in dark mode
  static const primaryDarkColor = Color.fromARGB(255, 20, 22, 23);

  /// Secondary background color
  static const bgColor = Color(0xffEDF8FF);

  /// The default color of background canvas
  static const canvasColor = Color(0xfff6f5f5);

  /// The default color of background canvas in dark mode
  static const canvasColorDarkMode = Color(0xff263238);

  /// The default color of the ``[BottomAppBar]`` in dark mode
  static const bottomAppBarColorDarkMode = Color.fromRGBO(22, 22, 29, 0.5);

  /// Default color for texts
  static const textColor = Color(0xFFFFFFFF);

  /// Color for titles
  static const titleColor = Color(0xff323238);
}
