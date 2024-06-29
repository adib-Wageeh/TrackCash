import 'package:flutter/material.dart';
import 'package:track_cash/core/data/model/transaction.dart';
import 'package:track_cash/ui/screens/calender/widgets/row_transaction_widget.dart';

class TransactionsListWidget extends StatelessWidget {

  final List<TransactionEntity> transactions;
  const TransactionsListWidget({required this.transactions,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          physics: const BouncingScrollPhysics()
          ,itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: InkWell(
                onTap: (){},
                onLongPress: (){},
                borderRadius: BorderRadius.circular(36),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(36),
                      border: Border.all(color: Colors.black,width: 0.5)
                  )
                  ,child: RowTransactionWidget(transactionEntity: transactions[index],),
                ),
              )
        );
      }, separatorBuilder: (context,index){
        return const SizedBox(height: 10,);
      }, itemCount: transactions.length),
    );
  }
}