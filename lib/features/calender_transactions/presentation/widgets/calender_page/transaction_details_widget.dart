import 'package:flutter/material.dart';
import 'package:track_cash/features/calender_transactions/presentation/widgets/calender_page/row_transaction_widget.dart';
import '../../../domain/entities/transaction.dart';

class TransactionDetailsWidget extends StatelessWidget {

  final TransactionEntitie transactionEntitie;
  const TransactionDetailsWidget({required this.transactionEntitie,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 60,
          child: RowTransactionWidget(transactionEntitie: transactionEntitie),
        ),
        Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(transactionEntitie.description,),
        ))
      ],
    );  }
}