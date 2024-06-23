import 'package:flutter/material.dart';

class AppColor {
  final List<Color> colors;

  const AppColor({required this.colors});

  Color operator [](int i) {
    if (i < 0 || i > colors.length) {
      throw Exception('invalid color index');
    }
    return colors[i];
  }
}
