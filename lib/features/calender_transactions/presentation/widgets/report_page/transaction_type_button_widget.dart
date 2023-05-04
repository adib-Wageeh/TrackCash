import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_cash/features/calender_transactions/presentation/cubit/report_cubit/get_report_cubit.dart';

class TransactionTypeReportButtonWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final String selectedText;
  const TransactionTypeReportButtonWidget({required this.selectedText,required this.text,Key? key,required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.080),
      child: InkWell(
        onTap: (){
          BlocProvider.of<GetReportCubit>(context).switchTransactionState( (text == "INCOME")?true:false );
        },
        child:
        Material(
          color: Colors.transparent,
          child: Column(
            children: [
              Text(text,style: TextStyle(
                  fontSize: 22
                  ,color: ( (isSelected && selectedText == text) ||
                  (isSelected==false && selectedText == text)
              )?Colors.white:Colors.white.withOpacity(0.5))),
              const SizedBox(height: 5,),
              ( (isSelected && selectedText == text) ||
                  (isSelected==false && selectedText == text)
              )?
              Container(height: 2.5,color: Colors.white,width: 100,):Container()
            ],
          ),
        ),
      ),
    );
  }
}