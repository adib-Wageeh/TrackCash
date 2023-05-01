import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:track_cash/features/calender_transactions/presentation/cubit/get_transactions_per_day/get_transactions_per_day_cubit.dart';
import '../../../../core/assets/assets.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);
  @override
  State<CalendarPage> createState() => _CalendarPageState();
}
DateTime selectedDate = DateTime.now();

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: TableCalendar(
       currentDay: selectedDate,
      focusedDay: selectedDate
            , firstDay: DateTime.utc(2000, 1, 1)
              , lastDay: DateTime.now().copyWith(year: DateTime.now().year+100),
            onDaySelected: (dateTime,datetime2){
            setState(() {
              selectedDate = dateTime;
            });
            BlocProvider.of<GetTransactionsPerDayCubit>(context).getTransactionsPerDay(dateTime);
            },
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(color: Color(0xff691515),
                  shape: BoxShape.circle),
            ),
          ),
        ),
        BlocConsumer<GetTransactionsPerDayCubit,GetTransactionsPerDayState>(
            listener: (context,state){
              if(state is GetTransactionsPerDayError){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            buildWhen: (curState,nextState){
              if(curState is GetTransactionsPerDayError){
                return false;
              }
              return true;
            },
            builder: (context,state){
          if(state is GetTransactionsPerDayLoaded){
            if(state.transactions.isEmpty){
              return Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.emptyDayIcon,height: 60,width: 60,),
                    const Text("No transactions added yet",style: TextStyle(color: Color(0xff691515)),)
                  ],
                ),
              );
            }else{
              return ListView.separated(itemBuilder: (context,index){
                return Text(state.transactions[index].amount.toString());
              }, separatorBuilder: (context,index){
                return const SizedBox(height: 5,);
              }, itemCount: state.transactions.length);
            }
          }
          return const Center(child: Text("data"),);
        })
      ],
    );
  }
}
