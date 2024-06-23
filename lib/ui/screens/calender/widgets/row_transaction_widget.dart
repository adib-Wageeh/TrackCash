import 'package:flutter/material.dart';
import 'package:track_cash/core/data/model/transaction.dart';

class RowTransactionWidget extends StatelessWidget {
  const RowTransactionWidget({
    super.key,
    required this.transactionEntity,
  });
  final TransactionEntity transactionEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(36)),
              child: Image.asset(transactionEntity.type.imagePath,color: transactionEntity.type.color,
                height: 55,width: 55,
              )),
        ),
        Text(transactionEntity.type.category,style: TextStyle(color: transactionEntity.type.color)),
        const Spacer(),
        Text("${(transactionEntity.type.type == 1)?"+":"-"} ${transactionEntity.amount.toString()}",
          style: TextStyle(
              color: (transactionEntity.type.type == 1)? Colors.green:Colors.red
          ),
        ),
        const SizedBox(width: 15,)
      ],
    );
  }
}