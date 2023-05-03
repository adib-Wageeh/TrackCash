import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TransactionsReports extends StatelessWidget {
  const TransactionsReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        // read about it in the PieChartData section
        sections: [
          PieChartSectionData(value: )
        ],
      ),
      swapAnimationDuration: const Duration(milliseconds: 150), // Optional
      swapAnimationCurve: Curves.linear, // Optional
    );
  }
}
