import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CalenderDatePickerWidget extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime newDate) onDateChanged;
  const CalenderDatePickerWidget({Key? key,required this.onDateChanged,required this.selectedDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('d/M/yyyy',context.locale.languageCode);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          TextButton(
              style: TextButton.styleFrom(textStyle: const TextStyle(color: Colors.white)
              ),
              onPressed: ()async{
                 await showDatePicker(
                  context: context,
                  locale: context.locale,
                  initialDate: DateTime.now(),
                  currentDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                ).then((value) {
                  if(value != null){
                    onDateChanged(value);
                  }
                });
              },
              child: Text("select_date".tr())),
          Text(dateFormat.format(selectedDate))
        ],
      ),
    );
  }
}