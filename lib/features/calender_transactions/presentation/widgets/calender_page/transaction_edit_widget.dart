import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_cash/features/calender_transactions/presentation/widgets/calender_page/text_form_widget.dart';
import '../../../domain/entities/transaction.dart';
import '../../cubit/remove_transaction/remove_transaction_cubit.dart';
import '../../cubit/update_transaction/update_transaction_cubit.dart';
import '../add_page/calender_date_picker_widget.dart';

final GlobalKey<FormState> keyEdit= GlobalKey();

class TransactionEditWidget extends StatelessWidget {

  final TransactionEntitie transactionEntitie;
  const TransactionEditWidget({Key? key,required this.transactionEntitie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyEdit
      ,child: ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        TextFormWidget(
          onSaved: (amount){
            BlocProvider.of<UpdateTransactionCubit>(context).amount = amount!;
          },labelText: "Amount",textInputType: TextInputType.number,textEditingController: TextEditingController(text: transactionEntitie.amount.toString()),)
        ,TextFormWidget(
          onSaved: (desc){
            BlocProvider.of<UpdateTransactionCubit>(context).description = desc!;
          },
          labelText: "Description",textInputType: TextInputType.text,textEditingController: TextEditingController(text: transactionEntitie.description),)
        ,const CalenderDatePickerWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              if(keyEdit.currentState!.validate()){
                keyEdit.currentState!.save();
                BlocProvider.of<UpdateTransactionCubit>(context).updateTransaction(transactionEntitie,context);
              }
            },style: ElevatedButton.styleFrom(backgroundColor: Colors.green), child: const Text("Save"),)
            ,
            const SizedBox(width: 30)
            ,ElevatedButton(onPressed: (){
              BlocProvider.of<RemoveTransactionCubit>(context).removeTransactionFunc(transactionEntitie, context);
            },style: ElevatedButton.styleFrom(backgroundColor: Colors.red), child: const Text("Delete"),)

          ],)
      ],
    ),
    );
  }
}