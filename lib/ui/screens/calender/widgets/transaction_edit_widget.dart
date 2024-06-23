import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_cash/core/data/model/transaction.dart';
import 'package:track_cash/ui/screens/calender/widgets/text_form_widget.dart';

final GlobalKey<FormState> keyEdit= GlobalKey();

class TransactionEditWidget extends StatelessWidget {

  final TransactionEntity transactionEntity;
  const TransactionEditWidget({Key? key,required this.transactionEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyEdit
      ,child: ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        TextFormWidget(
          onValidate: (txt){
            if(txt!.isEmpty){
              return "please enter valid data";
            }
          },
          onSaved: (amount){
            // BlocProvider.of<UpdateTransactionCubit>(context).amount = amount!;
          },labelText: "Amount",textInputType: TextInputType.number,textEditingController: TextEditingController(text: transactionEntity.amount.toString()),)
        ,TextFormWidget(
          onValidate: (txt){},
          onSaved: (desc){
            // BlocProvider.of<UpdateTransactionCubit>(context).description = desc!;
          },
          labelText: "Description",textInputType: TextInputType.text,textEditingController: TextEditingController(text: transactionEntity.description),)
        // ,CalenderDatePickerWidget(state: transactionEntitie),
        ,Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              if(keyEdit.currentState!.validate()){
                keyEdit.currentState!.save();
                // BlocProvider.of<UpdateTransactionCubit>(context).updateTransaction(transactionEntity,context);
              }
            },style: ElevatedButton.styleFrom(backgroundColor: Colors.green), child: const Text("Save"),)
            ,
            const SizedBox(width: 30)
            ,ElevatedButton(onPressed: (){
              // BlocProvider.of<RemoveTransactionCubit>(context).removeTransactionFunc(transactionEntity, context);
            },style: ElevatedButton.styleFrom(backgroundColor: Colors.red), child: const Text("Delete"),)

          ],)
      ],
    ),
    );
  }
}