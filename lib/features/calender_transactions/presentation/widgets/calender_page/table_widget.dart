import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../cubit/get_transactions_per_day/get_transactions_per_day_cubit.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: TableCalendar(
        currentDay: BlocProvider.of<GetTransactionsPerDayCubit>(context).selectedDay,
        focusedDay: DateTime.now()
        , firstDay: DateTime.utc(2000, 1, 1)
        , lastDay: DateTime.now().copyWith(year: DateTime.now().year+100),
        onDaySelected: (dateTime,datetime2){
          BlocProvider.of<GetTransactionsPerDayCubit>(context).getTransactionsPerDay(dateTime);
        },
        calendarStyle: const CalendarStyle(
          todayDecoration: BoxDecoration(color: Color(0xff691515),
              shape: BoxShape.circle),
        ),
      ),
    );
  }
}