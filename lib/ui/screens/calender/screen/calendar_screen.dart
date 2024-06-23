import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_cash/core/assets/assets.dart';
import 'package:track_cash/core/utils/common_functions.dart';
import 'package:track_cash/ui/screens/calender/cubit/calendar_cubit.dart';
import 'package:track_cash/ui/screens/calender/cubit/calendar_state.dart';
import '../../../widgets/empty_day_widget.dart';
import '../widgets/table_widget.dart';
import '../widgets/transaction_list_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  void _onStateChangeListener(BuildContext context, CalendarState state) {
    if (state.isSuccess) {
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
        appBar: AppBar(
            backgroundColor: Assets.mainColor,
            title: Text("TrackCash",
                style: GoogleFonts.vollkorn()
                    .copyWith(fontSize: 26, fontWeight: FontWeight.w700))),
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
                            transactions: cubit.transactions!)
                  ],
                );
              }
            }),
      ),
    );
  }
}
