import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scale_button/scale_button.dart';
import '../../../../../core/assets/assets.dart';
import '../../cubit/add_transaction/add_transaction_cubit.dart';
import '../../pages/add_transaction_page.dart';

class AddTransactionButton extends StatelessWidget {
  const AddTransactionButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ScaleButton(
          onTap: (){
            if(keyAmount.currentState!.validate()) {
              keyAmount.currentState!.save();
              BlocProvider.of<AddTransactionCubit>(context).addTransactionMethod(
                  context);
            }
          }
          ,child: Container(
          height: 48.0,
          width: 300.0,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Assets.mainColor,
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
