import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_cash/core/injection_container.dart';

class LocaleProvider extends ChangeNotifier {



  void changeLocale(Locale locale) {
    notifyListeners();
  }



}