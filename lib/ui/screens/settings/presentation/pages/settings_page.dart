import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track_cash/core/res/colors.dart';
import 'package:track_cash/ui/screens/settings/presentation/provider/locale_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.secondaryColor,
          title: Text('settings'.tr()),
        ),
        body: Column(
          children: [
            ListTile(
              title: Text('change_language'.tr()),
              trailing: DropdownButton(
                items: [
                  DropdownMenuItem(child: Text("English"), value: 'en'),
                  DropdownMenuItem(child: Text("العربية"), value: 'ar'),
                ],
                onChanged: (value) {
                  if (value != null) {
                    context.setLocale(Locale(value));
                    Provider.of<LocaleProvider>(context, listen: false)
                        .changeLocale(Locale(value));
                  }
                },
                value: context.locale.languageCode,
              ),
            )
          ],
        ),
      ),
    );
  }
}
