import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../cubit/theme_changer/theme_cubit.dart';

class ToggleButtonWidget extends StatelessWidget {
  const ToggleButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LiteRollingSwitch(
      value: BlocProvider.of<ThemeCubit>(context).toggleVal,
      width: 130,
      textSize: 18,
      textOn: 'Light',
      textOnColor: Colors.white,
      textOff: 'Dark',
      colorOn: const Color(0xff691515),
      colorOff: const Color(0xff691515),
      iconOn: Icons.light_mode_rounded,
      iconOff: Icons.dark_mode_rounded,
      animationDuration: const Duration(milliseconds: 300),
      onChanged: (bool state) {
        BlocProvider.of<ThemeCubit>(context).toggleTheme(state);
      },
      onDoubleTap: () {},
      onSwipe: () {},
      onTap: () {},
    );
  }
}