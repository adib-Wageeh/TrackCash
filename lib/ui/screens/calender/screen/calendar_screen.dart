import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_cash/core/res/colors.dart';
import 'package:track_cash/core/utils/common_functions.dart';
import 'package:track_cash/ui/screens/calender/cubit/calendar_cubit.dart';
import 'package:track_cash/ui/screens/calender/cubit/calendar_state.dart';
import '../../../widgets/empty_day_widget.dart';
import '../widgets/table_widget.dart';
import '../widgets/transaction_list_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  void _onStateChangeListener(BuildContext context, CalendarState state) {
    if (state.isSuccess) {
      final cubit = CalendarCubit.get(context);
      if(cubit.transactionsRemoved){
        showSuccessToast(context, 'deleted_successfully'.tr());
        cubit.transactionsRemoved = false;
      }
    } else if (state.isError) {
      state.mapOrNull(error: (data) {
        final error = data.failure?.error;
        showErrorToast(context, error!);
      });
    }
  }

  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalendarCubit>(
      lazy: false,
      create: (_) => CalendarCubit()..getTransactions(selectedDay),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
            backgroundColor: AppColors.secondaryColor,
            elevation: 0,
            title: Text("app_name".tr(),
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold))),
        body: BlocConsumer<CalendarCubit, CalendarState>(
            listener: _onStateChangeListener,
            builder: (context, state) {
              final cubit = CalendarCubit.get(context);
              if (state.isLoading) {
                return Column(
                  children: [
                    TableWidget(
                        onDaySelected: (date) {
                          selectedDay = date;
                          cubit.getTransactions(selectedDay);
                        },
                        selectedDay: selectedDay),
                    const CircularProgressIndicator.adaptive()
                  ],
                );
              } else {
                return Column(
                  children: [
                    TableWidget(
                        onDaySelected: (date) {
                          selectedDay = date;
                          cubit.getTransactions(selectedDay);
                        },
                        selectedDay: selectedDay),
                    (cubit.transactions!.isEmpty)
                        ? const EmptyDayWidget()
                        : TransactionsListWidget(
                            cubit: cubit, transactions: cubit.transactions!),
                    SizedBox(height: 16,)
                  ],
                );
              }
            }),
      ),
    );
  }
}
