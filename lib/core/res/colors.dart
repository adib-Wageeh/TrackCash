import 'package:flutter/material.dart';
import 'package:track_cash/core/res/app_color.dart';

class AppColors {


  static AppColor successColors = const AppColor(colors: [
    Color(0xFFB2E2CC),
    Color(0xFF2B9464),
  ]);

  static AppColor warningColors = const AppColor(colors: [
    Color(0xFFFFFAE6),
    Color(0xFFFFCC00),
    Color(0xFFFDED95),
  ]);

  static AppColor errorColors = const AppColor(colors: [
    Color(0xFFFAE8E9),
    Color(0xFFDE535C),
  ]);

  /// neutral Colors
  static AppColor neutralColors = const AppColor(colors: [
    Color(0xFFffffff),
    Color(0xFFF8F9FA),
    Color(0xFFF1F3F5),
    Color(0xFFE9ECEF),
    Color(0xFFDEE2E6),
    Color(0xFFCED4DA),
    Color(0xFFADB5BD),
    Color(0xFF6A7178),
    Color(0xFF4F575E),
    Color(0xFF181415),
    Color(0xFF101213),
  ]);

  static Color background = const Color(0xfff7f7f7);
  static Color backgroundDarker = neutralColors[1];
  static Color colorIcon = const Color(0xff4576f5);

  static Color black = neutralColors[10];

  static const Color colorAccent = Color(0xffFF8B17);

  static const borderColor = Color(0xffDAE4FD);

  static Color grayDimmed = neutralColors[6];
  static Color colorGray = neutralColors[7];
  static Color colorGrayDarker = neutralColors[8];
  static Color grayLight = neutralColors[5];
  // static Color gray4 = neutralColors[4];
  static Color green = successColors[1];

  static Color red = errorColors[1];
  static Color successColor = const Color(0xFF00ADA6);
  static Color errorColor = const Color(0xFFCE3E5D);
  static Color warningColor = const Color(0xFFFF9C3B);
  static Color white = neutralColors[0];
  static Color whatAppGreen = const Color(0xFF4CAF50);
  static const scaffoldBackground = Colors.transparent;
  static const greyColor = Color(0xffA3A3A3);
  static const whiteGreyColor = Color(0xffEDEDED);
  static const planCardColor = Color(0xffF7A5A5);
  static const greyTextColor = Color(0xff545454);
  static const orangePrimaryLight = Color(0xFFFFE2CE);
  static const orangePrimaryWarm = Color(0xFFFFC4A2);
  static const warmBlue = Color(0xFF1379CB);
  static const appBarColor = Color(0xff20A6ED);
  static const textFormFieldBorderColor = Color(0xffBABABA);
  static const childIconBackgroundColor = Color(0xffD9D9D9);
  static const textFieldBlackHintColor = Color(0xff000000);
  static const greenAccentColor = Color(0xff42AF3C);
  static const grayBorderColor = Color(0xff707070);
  static const grayColor = Color(0xffE2E2E2);
  static const accentRedColor = Color(0xffEA0606);


}
