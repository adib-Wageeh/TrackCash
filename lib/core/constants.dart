import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class TranslationsConstants {
  static const String localeEN = 'en';
  static const String localeAr = 'ar';

  static bool isEnglish(BuildContext context) =>
      (context.locale.languageCode == TranslationsConstants.localeEN);

  static bool isLTR(BuildContext context) =>
      (context.locale.languageCode == TranslationsConstants.localeEN);

}
