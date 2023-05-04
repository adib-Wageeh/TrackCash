import 'package:flutter/material.dart';
import 'package:track_cash/features/calender_transactions/presentation/widgets/report_page/transaction_type_button_widget.dart';
import '../../../../../core/assets/assets.dart';

class TransactionTypeSelectorReportContainerWidget extends StatelessWidget {
  final bool isSelected;
  final String selectedText;
  const TransactionTypeSelectorReportContainerWidget({required this.selectedText,Key? key,required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.145,
      decoration: const BoxDecoration(
          color: Assets.mainColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(46),bottomRight: Radius.circular(46))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TransactionTypeReportButtonWidget(text: "INCOME",isSelected:isSelected,selectedText: selectedText),
          TransactionTypeReportButtonWidget(text: "EXPENSE",isSelected:isSelected,selectedText: selectedText,)
        ],
      )
    );
  }
}
