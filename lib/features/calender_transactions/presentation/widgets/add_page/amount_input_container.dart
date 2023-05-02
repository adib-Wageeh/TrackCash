import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets/assets.dart';
import '../../../../settings/presentation/cubit/theme_changer/theme_cubit.dart';
import '../../cubit/add_transaction/add_transaction_cubit.dart';

class AmountInputContainer extends StatelessWidget {
  const AmountInputContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeCubit>(context).toggleVal;
    TextEditingController textEditingController = TextEditingController(text: BlocProvider.of<AddTransactionCubit>(context).getAmount());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              controller: textEditingController,
              validator: (txt){
                if(txt=="" || double.parse(txt!) <= 0){
                  return "Please enter valid amount";
                }
              },
              onChanged: (val){
                if(double.parse(val) > 0){
                  BlocProvider.of<AddTransactionCubit>(context).setAmount(val);
                }
              },
              onSaved: (txt){
                BlocProvider.of<AddTransactionCubit>(context).setAmount(txt);
              },
              decoration: InputDecoration(
                  labelText: "Amount",
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
              keyboardType: TextInputType.number,
            ),
          )
      ),
    );
  }
}