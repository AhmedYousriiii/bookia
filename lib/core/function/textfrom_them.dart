import 'package:boookia/core/constants/font_app.dart';
import 'package:boookia/core/utils/color_app.dart';
import 'package:flutter/material.dart';

class TextfromThem {
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: ColorApp.backgroundcolor,
    appBarTheme: AppBarTheme(
      color: ColorApp.backgroundcolor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: ColorApp.bordercolor, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: ColorApp.bordercolor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
    ),
    fontFamily: FontApp.dmserifdisplay,
  );
}
