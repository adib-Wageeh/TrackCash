import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/assets/assets.dart';
import '../../../../settings/presentation/cubit/theme_changer/theme_cubit.dart';

class TextFormWidget extends StatelessWidget {

  final String labelText;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final Function(String?)? onSaved;
  const TextFormWidget({required this.onSaved,Key? key,required this.textEditingController,required this.labelText,required this.textInputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeCubit>(context).toggleVal;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        validator: (txt){
          if(txt!.isEmpty){
            return "please enter valid data";
          }
        },
        onSaved: onSaved,
        keyboardType: textInputType,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(color: (theme)?Assets.mainColor:Colors.white),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(36),borderSide: BorderSide(color: (theme)?Assets.mainColor:Colors.white)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(36),borderSide: BorderSide(color: (theme)?Assets.mainColor:Colors.white)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(36),borderSide: BorderSide(color: (theme)?Assets.mainColor:Colors.white)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(36),borderSide: const BorderSide(color: Colors.red)
            ),
            floatingLabelAlignment: FloatingLabelAlignment.center
        ),
        controller: textEditingController,
      ),
    );
  }
}
