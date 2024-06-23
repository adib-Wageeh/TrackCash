import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_cash/core/assets/assets.dart';
import 'package:track_cash/ui/screens/settings/presentation/cubit/theme_changer/theme_cubit.dart';

class EmptyDayWidget extends StatelessWidget {
  const EmptyDayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: Column(
          children: [
            (BlocProvider.of<ThemeCubit>(context).toggleVal)?
            Image.asset(Assets.emptyDayIcon,height: 60,width: 60,):
            Image.asset(Assets.emptyDayIconWhite,height: 60,width: 60,)
            ,
            const SizedBox(height: 5,),
            const Text("No transactions added yet",)
          ],
        ),
      ),
    );
  }
}