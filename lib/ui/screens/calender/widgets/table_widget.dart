import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TableWidget extends StatelessWidget {

  final DateTime selectedDay;
  final Function(DateTime) onDaySelected;
  const TableWidget({Key? key,required this.selectedDay,required this.onDaySelected}) : super(key: key);

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
          onDaySelected: (dateTime,datetime2)=>onDaySelected(dateTime),
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