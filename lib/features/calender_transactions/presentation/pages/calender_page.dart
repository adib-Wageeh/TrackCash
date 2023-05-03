import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_cash/features/calender_transactions/presentation/cubit/get_transactions_per_day/get_transactions_per_day_cubit.dart';
import '../widgets/calender_page/empty_day_widget.dart';
import '../widgets/calender_page/table_widget.dart';
import '../widgets/calender_page/transaction_list_widget.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);
  @override
  State<CalendarPage> createState() => _CalendarPageState();
}
class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetTransactionsPerDayCubit,GetTransactionsPerDayState>(
        listener: (context,state){
          if(state is GetTransactionsPerDayError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        buildWhen: (curState,nextState) =>(curState is GetTransactionsPerDayError)?false:true,
        builder: (context,state){
      if(state is GetTransactionsPerDayLoaded){
        if(state.transactions.isEmpty){
          return Column(
            children: const [
              TableWidget(),
              EmptyDayWidget()
            ],
          );
        }else{
          return Column(
            children: [
              const TableWidget(),
              TransactionsListWidget(transactions: state.transactions,)
            ],
          );
        }
      }
      else if(state is GetTransactionsPerDayLoading){
        return Column(
          children: const [
            TableWidget(),
          ],
        );
      }
      return const Center();
    });
  }
}