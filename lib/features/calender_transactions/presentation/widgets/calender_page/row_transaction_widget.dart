import 'package:flutter/material.dart';
import '../../../domain/entities/transaction.dart';

class RowTransactionWidget extends StatelessWidget {
  const RowTransactionWidget({
    super.key,
    required this.transactionEntitie,
  });
  final TransactionEntitie transactionEntitie;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(36)),
              child: Image.asset(transactionEntitie.imagePath,color: transactionEntitie.color,
                height: 55,width: 55,
              )),
        ),
        Text(transactionEntitie.type.category,style: TextStyle(color: transactionEntitie.color)),
        const Spacer(),
        Text("${(transactionEntitie.type.type == 1)?"+":"-"} ${transactionEntitie.amount.toString()}",
          style: TextStyle(
              color: (transactionEntitie.type.type == 1)? Colors.green:Colors.red
          ),
        ),
        const SizedBox(width: 15,)
      ],
    );
  }
}