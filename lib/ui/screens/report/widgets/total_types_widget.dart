import 'package:flutter/material.dart';
import '../../../../core/data/model/transaction_type_total.dart';

class TotalTypesWidget extends StatelessWidget {
  final List<TransactionTypeTotal> transactions;

  const TotalTypesWidget({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36)),
                      child: Image.asset(
                        transactions[index].transactionEntity.type.imagePath,
                        color: transactions[index].transactionEntity.type.color,
                        height: 55,
                        width: 55,
                      )),
                ),
                Text(transactions[index].transactionEntity.type.category,
                    style: TextStyle(
                        color:
                            transactions[index].transactionEntity.type.color)),
                const Spacer(),
                Text(
                  "${(transactions[index].transactionEntity.type.type == 1) ? "+" : "-"} ${transactions[index].amount.toString()}",
                  style: TextStyle(
                      color:
                          (transactions[index].transactionEntity.type.type == 1)
                              ? Colors.green
                              : Colors.red),
                ),
                const SizedBox(
                  width: 15,
                )
              ],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: transactions.length),
    );
  }
}
