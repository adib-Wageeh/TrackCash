import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_cash/features/calender_transactions/presentation/widgets/add_page/transaction_type_button_widget.dart';
import '../../../../../core/assets/assets.dart';
import '../../cubit/add_transaction/add_transaction_cubit.dart';

class TransactionTypeSelectorContainerWidget extends StatelessWidget {
  const TransactionTypeSelectorContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.140,
      decoration: const BoxDecoration(
          color: Assets.mainColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(46),bottomRight: Radius.circular(46))
      ),
      child: BlocBuilder<AddTransactionCubit, AddTransactionState>(
        builder: (context, state) {
          if(state is AddTransactionIncome){
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                TransactionTypeButtonWidget(text: "INCOME",type: true),
                TransactionTypeButtonWidget(text: "EXPENSE",type: false,)
              ],
            );
          }else{
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                TransactionTypeButtonWidget(text: "INCOME",type: true),
                TransactionTypeButtonWidget(text: "EXPENSE",type: false,)
              ],
            );
          }
        },
      ),
    );
  }
}