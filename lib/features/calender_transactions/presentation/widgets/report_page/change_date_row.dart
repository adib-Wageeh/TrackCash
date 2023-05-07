import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/report_cubit/get_report_cubit.dart';

class ChangeDateRow extends StatelessWidget {
  final DateTime selectedDate;
  const ChangeDateRow({
    super.key,
    required this.selectedDate
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: (){
            BlocProvider.of<GetReportCubit>(context).editMonth(false);
          },icon: const Icon(Icons.arrow_back_ios)),
          Text("${selectedDate.year.toString()}/${selectedDate.month.toString()}",style:
          const TextStyle(fontSize: 18)),
          IconButton(onPressed: (){
            BlocProvider.of<GetReportCubit>(context).editMonth(true);
          },icon: const Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
  }
}

