import 'package:flutter/material.dart';

class TotalTransactionTextWidget extends StatelessWidget {
  final double totalSpent;
  final bool isIncome;

  const TotalTransactionTextWidget(
      {required this.isIncome, required this.totalSpent, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text("Total ${(isIncome)?'Income':'Expense'} = ${totalSpent.toString()}"),
    );
  }
}