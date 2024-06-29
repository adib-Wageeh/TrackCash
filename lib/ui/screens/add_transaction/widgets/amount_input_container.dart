import 'package:flutter/material.dart';
import 'package:track_cash/core/assets/assets.dart';
import 'package:track_cash/core/res/colors.dart';

class AmountInputContainer extends StatelessWidget {
  final TextEditingController textEditingController;
  final double borderRadius;
  final String labelText;
  final TextInputType textInputType;
  final int minLines;

  const AmountInputContainer(
      {Key? key,
      this.textInputType = TextInputType.text,
      required this.textEditingController,
      required this.labelText,
      this.borderRadius = 36,
      this.minLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 12),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle:
                TextStyle(color: AppColors.secondaryColor,),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                    color: AppColors.secondaryColor,)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                    color: AppColors.secondaryColor,)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                    color: AppColors.secondaryColor,)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(color: Colors.red)),
            floatingLabelAlignment: FloatingLabelAlignment.center),
        keyboardType: textInputType,
        minLines: minLines,
        maxLines: 4,
      ),
    );
  }
}
