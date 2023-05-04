import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_cash/features/calender_transactions/presentation/widgets/calender_page/row_transaction_widget.dart';
import 'package:track_cash/features/calender_transactions/presentation/widgets/calender_page/transaction_details_widget.dart';
import 'package:track_cash/features/calender_transactions/presentation/widgets/calender_page/transaction_edit_widget.dart';
import '../../../domain/entities/transaction.dart';
import '../../cubit/animateContainer/animate_container_cubit.dart';

class TransactionsListWidget extends StatelessWidget {

  final List<TransactionEntitie> transactions;
  const TransactionsListWidget({required this.transactions,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          physics: const BouncingScrollPhysics()
          ,itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: BlocBuilder<AnimateContainerCubit, AnimateContainerState>(
            builder: (context, state) {
              return InkWell(
                onTap: (){
                  BlocProvider.of<AnimateContainerCubit>(context).startDetails(index);
                },
                onLongPress: (){
                  BlocProvider.of<AnimateContainerCubit>(context).startEditing(index,transactions[index],context);
                },
                borderRadius: BorderRadius.circular(36),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: BlocProvider.of<AnimateContainerCubit>(context).getHeight(index),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(36),
                      border: Border.all(color: Theme.of(context).accentColor,width: 0.5)
                  )
                  ,child: BlocBuilder<AnimateContainerCubit, AnimateContainerState>(
                  builder: (context, state) {
                    if(state is AnimateContainerDetails && index == BlocProvider.of<AnimateContainerCubit>(context).pressedIndex){
                      return TransactionDetailsWidget(transactionEntitie: transactions[index],);
                    }else if(state is AnimateContainerEdit && index == BlocProvider.of<AnimateContainerCubit>(context).pressedIndex){
                      return TransactionEditWidget(transactionEntitie: transactions[index],);
                    }
                    return RowTransactionWidget(transactionEntitie: transactions[index],);
                  },
                ),
                ),
              );
            },
          ),
        );
      }, separatorBuilder: (context,index){
        return const SizedBox(height: 10,);
      }, itemCount: transactions.length),
    );
  }
}