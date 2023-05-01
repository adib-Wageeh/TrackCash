import 'package:flutter/material.dart';

enum AppThemes{
  Light,
  Dark
}

final appThemeData={
AppThemes.Light : ThemeData(brightness: Brightness.light,primaryColor: const Color(0xff691515),
textTheme: const TextTheme(bodyMedium: TextStyle(color: Color(0xff691515))),
  accentColor: Colors.black,
),
  AppThemes.Dark : ThemeData(brightness: Brightness.dark,primaryColor: Colors.white,
      textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      accentColor: Colors.white,

  ),

};