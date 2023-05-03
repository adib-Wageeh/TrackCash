import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:track_cash/features/calender_transactions/domain/entities/transaction.dart';
import 'package:track_cash/features/calender_transactions/domain/usecases/remove_transaction.dart';

import '../animateContainer/animate_container_cubit.dart';
import '../get_transactions_per_day/get_transactions_per_day_cubit.dart';

part 'remove_transaction_state.dart';

class RemoveTransactionCubit extends Cubit<RemoveTransactionState> {
  RemoveTransactionCubit({required this.removeTransaction}) : super(RemoveTransactionInitial());
  RemoveTransaction removeTransaction;

  void removeTransactionFunc(TransactionEntitie transactionEntitie,BuildContext context)async{
    print(transactionEntitie.id);
    final res = await removeTransaction.call(Params(transaction: transactionEntitie));

    res.fold((l) => print(l), (r){
      BlocProvider.of<GetTransactionsPerDayCubit>(context).getTransactionsPerDay(transactionEntitie.date);
      BlocProvider.of<AnimateContainerCubit>(context).isEditing = false;
      BlocProvider.of<AnimateContainerCubit>(context).pressedIndex = -1;
    });

  }

}
