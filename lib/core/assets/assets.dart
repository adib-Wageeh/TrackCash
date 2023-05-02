import 'package:flutter/material.dart';

class Assets{

  static const emptyDayIcon = "assets/box.png";
  static const emptyDayIconWhite = "assets/boxWhite.png";

  static const mainColor = Color(0xff691515);
  static const Map<String,Color> incomeImages = {
    'assets/income/money.png': Color(0xff4ea0ee),
    'assets/income/gift.png':Color(0xffEDC73B),
    'assets/income/give-money.png':Color(0xff37C9A6),
    'assets/income/signing.png':Color(0xffCC45EE)
  };

  static const Map<String,dynamic> expenseImages = {
    "assets/expense/grocery.png": Color(0xff4ea0ee),
    "assets/expense/specification.png":Color(0xffEDC73B),
    "assets/expense/bus.png":Color(0xff37C9A6),
    "assets/expense/home.png":Color(0xffCC45EE),
    "assets/expense/wardrobe.png":Color(0xff4ea0ee),
    "assets/expense/skincare.png":Color(0xffEDC73B),
    "assets/expense/healthcare.png":Color(0xff37C9A6),
    "assets/expense/education.png":Color(0xffCC45EE)
  };

}