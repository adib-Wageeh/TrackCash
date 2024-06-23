import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalenderDatePickerWidget extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime newDate) onDateChanged;
  const CalenderDatePickerWidget({Key? key,required this.onDateChanged,required this.selectedDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('d/M/yyyy');
    return Row(
      children: [
        TextButton(
            style: TextButton.styleFrom(textStyle: const TextStyle(color: Colors.white)
            ),
            onPressed: ()async{
               await showDatePicker(
                context: context,
                currentDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2050),
              ).then((value) {
                if(value != null){
                  onDateChanged(value);
                }
              });
            },
            child: const Text("Select Date")),
        Text(dateFormat.format(selectedDate))
      ],
    );
  }
}