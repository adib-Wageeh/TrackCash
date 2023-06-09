import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/transaction_type_total.dart';

class PieChartViewWidget extends StatelessWidget {

  final List<TransactionTypeTotal> transactions;
  const PieChartViewWidget({
    super.key,
    required this.transactions
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.38,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: PieChart(
          PieChartData(
            sections:
            transactions.map((e) {
              return PieChartSectionData(
                title: e.type.category,
                badgePositionPercentageOffset: 1.5,
                color: e.color,
                value: e.amount,
                showTitle: false,
                badgeWidget: Text(e.type.category),
              );
            }).toList()
            ,),
          swapAnimationDuration: const Duration(milliseconds: 100), // Optional
          swapAnimationCurve: Curves.bounceIn,
        ),
      ),
    );
  }
}
