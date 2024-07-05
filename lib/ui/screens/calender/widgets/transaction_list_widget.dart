import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:track_cash/core/data/model/transaction.dart';
import 'package:track_cash/core/enums/transaction_type.dart';
import 'package:track_cash/core/res/colors.dart';
import 'package:track_cash/ui/screens/calender/cubit/calendar_cubit.dart';
import 'package:track_cash/ui/screens/calender/widgets/row_transaction_widget.dart';

class TransactionsListWidget extends StatelessWidget {

  final List<TransactionEntity> transactions;
  final CalendarCubit cubit;
  const TransactionsListWidget({
  required this.cubit
  ,required this.transactions,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          physics: const BouncingScrollPhysics()
          ,itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: InkWell(
                onTap: (){
                  showAdaptiveDialog(context: context, builder: (context){
                    return AlertDialog.adaptive(
                      backgroundColor: AppColors.primaryColor,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(transactions[index].type.category.translate()),
                          Text(transactions[index].amount.toString()),
                        ],
                      ),
                      content: Text(transactions[index].description),
                      actions: [
                        ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.red)
                        ,onPressed: (){
                          Navigator.of(context).pop();
                          cubit.removeTransaction(transactions[index]);
                        }, child: Text('delete'.tr()))
                      ],
                    );
                  });
                },
                borderRadius: BorderRadius.circular(36),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(36),
                      border: Border.all(color: Colors.black,width: 0.5)
                  )
                  ,child: RowTransactionWidget(transactionEntity: transactions[index],),
                ),
              )
        );
      }, separatorBuilder: (context,index){
        return const SizedBox(height: 10,);
      }, itemCount: transactions.length),
    );
  }
}