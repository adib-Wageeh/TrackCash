import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:track_cash/core/res/colors.dart';

class TableWidget extends StatelessWidget {

  final DateTime selectedDay;
  final Function(DateTime) onDaySelected;
  const TableWidget({Key? key,required this.selectedDay,required this.onDaySelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.015),
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.45,
        child: TableCalendar(
          headerVisible: true,
          locale: context.locale.languageCode,
          daysOfWeekHeight: 24,
          headerStyle: HeaderStyle(
            formatButtonVisible: false
          ),
          rowHeight: MediaQuery.of(context).size.height*0.05,
          currentDay: selectedDay,
          focusedDay: selectedDay
          , firstDay: DateTime.utc(2000, 1, 1)
          , lastDay: DateTime(2100),
          onDaySelected: (dateTime,datetime2)=>onDaySelected(dateTime),
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(color: AppColors.secondaryColor,
            shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}