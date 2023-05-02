import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_cash/features/calender_transactions/presentation/cubit/change_category/change_category_cubit.dart';
import '../../cubit/add_transaction/add_transaction_cubit.dart';

class TransactionTypeButtonWidget extends StatelessWidget {
  final String text;
  final bool type;
  const TransactionTypeButtonWidget({required this.type,required this.text,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.080),
      child: InkWell(
        onTap: (){
          BlocProvider.of<ChangeCategoryCubit>(context).onCategoryChange(newCategoryIndex: 0);
          BlocProvider.of<AddTransactionCubit>(context).switchTransactionType(type);
        },
        child:
        Material(
          color: Colors.transparent,
          child: Column(
            children: [
              Text(text,style: TextStyle(
                  fontSize: 22
                  ,color: (BlocProvider.of<AddTransactionCubit>(context).isIncomeTransaction == type)?Colors.white:Colors.white.withOpacity(0.5))),
              const SizedBox(height: 5,),
              (BlocProvider.of<AddTransactionCubit>(context).isIncomeTransaction == type)?
              Container(height: 2.5,color: Colors.white,width: 100,):Container()
            ],
          ),
        ),
      ),
    );
  }
}