import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_cash/core/utils/common_functions.dart';
import 'package:track_cash/ui/widgets/empty_day_widget.dart';
import 'package:track_cash/ui/screens/report/widgets/change_date_row.dart';
import 'package:track_cash/ui/screens/report/widgets/pie_chart_view.dart';
import 'package:track_cash/ui/screens/report/widgets/total_types_widget.dart';
import 'package:track_cash/ui/screens/report/cubit/report_cubit.dart';
import 'package:track_cash/ui/screens/report/cubit/report_state.dart';
import 'package:track_cash/ui/screens/report/widgets/total_transaction_text_widget.dart';
import 'package:track_cash/ui/widgets/transaction_type_selector_container_widget.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  void _onStateChangeListener(BuildContext context, ReportState state) {
    if (state.isSuccess) {
    } else if (state.isError) {
      state.mapOrNull(error: (data) {
        final error = data.failure?.error;
        showErrorToast(context, error!);
      });
    }
  }

  bool isIncome = true;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReportCubit>(
      lazy: false,
      create: (_) => ReportCubit(),
      child: BlocConsumer<ReportCubit, ReportState>(
        listener: _onStateChangeListener,
        builder: (context, state) {
          final cubit = context.read<ReportCubit>();
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                TransactionTypeSelectorContainerWidget(
                  isIncome: isIncome,
                  onPressed: (type) {
                    if (type == 2 && isIncome || (type == 1 && !isIncome)) {
                      setState(() {
                        isIncome = !isIncome;
                      });
                    }
                  },
                ),
                ChangeDateRow(
                  selectedDate: selectedDate,
                  onNextPressed: () {
                    setState(() {
                      int newYear = selectedDate.year +
                          ((selectedDate.month + 1 - 1) ~/ 12);
                      int newMonth = (selectedDate.month + 1 - 1) % 12 + 1;
                      selectedDate = DateTime(newYear, newMonth);
                    });
                  },
                  onPreviewsPressed: () {
                    setState(() {
                      int newMonth = selectedDate.month - 1;
                      int newYear = selectedDate.year;
                      if (newMonth == 0) {
                        newMonth = 12;
                        newYear -= 1;
                      }
                      selectedDate = DateTime(newYear, newMonth);
                    });
                  },
                ),
                if (cubit.transactionTypesTotal != null) ...[
                  PieChartViewWidget(
                      transactions: cubit.transactionTypesTotal!),
                  TotalTransactionTextWidget(
                      isIncome: isIncome, totalSpent: cubit.total!),
                  TotalTypesWidget(
                    transactions: cubit.transactionTypesTotal!,
                  )
                ],
                if(cubit.transactionTypesTotal == null)
                  const EmptyDayWidget(),
              ],
            );
          }
        },
      ),
    );
  }
}
