import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/assets/assets.dart';
import '../../cubit/add_transaction/add_transaction_cubit.dart';

class CalenderDatePickerWidget extends StatelessWidget {
  const CalenderDatePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            style: TextButton.styleFrom(textStyle: const TextStyle(color: Colors.white)
            ),
            onPressed: ()async{
               await showCalendarDatePicker2Dialog(
                context: context,
                config: CalendarDatePicker2WithActionButtonsConfig(
                    selectedDayTextStyle: const TextStyle(color:Assets.mainColor)),
                dialogSize: const Size(325, 400),
                value: [DateTime.now()],
                borderRadius: BorderRadius.circular(15),
              ).then((value) {
                if(value != null){
                  BlocProvider.of<AddTransactionCubit>(context).setDateTime(value[0]);
                }
              });
            },
            child: const Text("Select Date")),
        Text("${BlocProvider.of<AddTransactionCubit>(context).selectedDate.day}/${BlocProvider.of<AddTransactionCubit>(context).selectedDate.month}/${BlocProvider.of<AddTransactionCubit>(context).selectedDate.year}")
      ],
    );
  }
}