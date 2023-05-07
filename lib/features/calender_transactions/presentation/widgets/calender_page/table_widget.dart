import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../cubit/get_transactions_per_day/get_transactions_per_day_cubit.dart';

class TableWidget extends StatelessWidget {

  final DateTime selectedDay;
  const TableWidget({Key? key,required this.selectedDay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.015),
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.40,
        child: TableCalendar(
          headerVisible: false,
          rowHeight: MediaQuery.of(context).size.height*0.060,
          currentDay: selectedDay,
          focusedDay: selectedDay
          , firstDay: DateTime.utc(2000, 1, 1)
          , lastDay: DateTime.now().copyWith(year: DateTime.now().year+100),
          onDaySelected: (dateTime,datetime2){

            BlocProvider.of<GetTransactionsPerDayCubit>(context).getTransactionsPerDay(dateTime);
          },
          calendarStyle: const CalendarStyle(
            todayDecoration: BoxDecoration(color: Color(0xff691515),
            shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}