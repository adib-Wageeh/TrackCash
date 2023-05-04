import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:track_cash/features/calender_transactions/presentation/cubit/report_cubit/get_report_cubit.dart';
import '../widgets/empty_day_widget.dart';
import '../widgets/report_page/change_date_row.dart';
import '../widgets/report_page/pie_chart_view.dart';
import '../widgets/report_page/total_transaction_widget.dart';
import '../widgets/report_page/transaction_type_selector_container_widget.dart';

class TransactionsReports extends StatelessWidget {
  const TransactionsReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetReportCubit, GetReportState>(
      listener: (context,state){
        if(state is GetReportLoading){
            EasyLoading.show();
        }else{
          EasyLoading.dismiss();
        }
      },
      buildWhen: (curr,next){
        if(next is GetReportLoading){
          return false;
        }
        return true;
      },
      builder: (context, state) {
          if(state is GetExpenseReportInMonthLoaded){
            return Column(
              children: [
                TransactionTypeSelectorReportContainerWidget(isSelected:state.isSelected,selectedText: state.selectedText),
                ChangeDateRow(selectedDate:state.selectedDate),
                PieChartViewWidget(transactions: state.transactions),
                TotalTransactionTextWidget(currState: state.selectedText, totalSpent: state.total),
                TotalTransactionWidget(transactions: state.transactions,)
              ],
            );
          }else if(state is GetIncomeReportInMonthLoaded){
            return Column(
              children: [
                TransactionTypeSelectorReportContainerWidget(isSelected: state.isSelected,selectedText: state.selectedText),
                ChangeDateRow(selectedDate:state.selectedDate),
                PieChartViewWidget(transactions: state.transactions),
                TotalTransactionTextWidget(currState: state.selectedText, totalSpent: state.total),
                TotalTransactionWidget(transactions: state.transactions,)
              ],
            );

          } else if(state is GetReportEmpty){
            return Column(
              children: [
                TransactionTypeSelectorReportContainerWidget(isSelected: state.isSelected,selectedText: state.selectedText),
                ChangeDateRow(selectedDate: state.selectedDate),
                const EmptyDayWidget(),
              ],
            );
          }
          return Container();
      },
    );
  }
}

class TotalTransactionTextWidget extends StatelessWidget {
  final double totalSpent;
  final String currState;
  const TotalTransactionTextWidget({required this.currState,required this.totalSpent,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Total $currState = ${totalSpent.toString()}");
  }
}
