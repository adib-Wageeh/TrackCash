import 'package:flutter/material.dart';
import 'package:scale_button/scale_button.dart';
import 'package:track_cash/core/assets/assets.dart';
import 'package:track_cash/core/res/colors.dart';

class AddTransactionButton extends StatelessWidget {
  const AddTransactionButton({Key? key,required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ScaleButton(
          onTap: ()=>onTap()
          ,child: Container(
          height: 48.0,
          width: 300.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
          ),
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.white,fontSize: 16),
          ),
        ),),
      ),
    );
  }
}
