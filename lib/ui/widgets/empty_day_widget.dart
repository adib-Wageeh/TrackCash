import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:track_cash/core/assets/assets.dart';
import 'package:track_cash/core/res/colors.dart';

class EmptyDayWidget extends StatelessWidget {
  const EmptyDayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: Column(
          children: [
            Image.asset(
              Assets.emptyDayIcon,
              height: 60,
              width: 60,
              color: AppColors.secondaryColor,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "no_transactions".tr(),
            )
          ],
        ),
      ),
    );
  }
}
