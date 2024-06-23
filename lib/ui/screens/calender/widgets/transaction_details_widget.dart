import 'package:flutter/material.dart';
import 'package:track_cash/core/data/model/transaction.dart';
import 'package:track_cash/ui/screens/calender/widgets/row_transaction_widget.dart';


class TransactionDetailsWidget extends StatelessWidget {

  final TransactionEntity transactionEntity;
  const TransactionDetailsWidget({required this.transactionEntity,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 60,
          child: RowTransactionWidget(transactionEntity: transactionEntity),
        ),
        Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(transactionEntity.description,),
        ))
      ],
    );  }
}