import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/assets/assets.dart';
import '../../../../settings/presentation/cubit/theme_changer/theme_cubit.dart';

class AmountInputContainer extends StatelessWidget {

  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String?)? onSavedFunc;
  final double borderRadius;
  final String labelText;
  final TextInputType textInputType;
  final int minLines;
  const AmountInputContainer({Key? key,this.textInputType = TextInputType.text,required this.textEditingController,required this.onChanged,required this.onSavedFunc
  ,required this.validator,required this.labelText,this.borderRadius=36,this.minLines = 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeCubit>(context).toggleVal;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20,top: 12),
      child: TextFormField(
        controller: textEditingController,
        validator: validator,
        onChanged: onChanged,
        onSaved: onSavedFunc,

        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(color: (theme)?Assets.mainColor:Colors.white),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),borderSide: BorderSide(color: (theme)?Assets.mainColor:Colors.white)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),borderSide: BorderSide(color: (theme)?Assets.mainColor:Colors.white)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),borderSide: BorderSide(color: (theme)?Assets.mainColor:Colors.white)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),borderSide: const BorderSide(color: Colors.red)
            ),
            floatingLabelAlignment: FloatingLabelAlignment.center
        ),
        keyboardType: textInputType,
        minLines: minLines,
        maxLines: 4,
      ),
    );
  }
}