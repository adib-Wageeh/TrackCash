import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/transaction.dart';
import '../../../domain/usecases/edit_transaction.dart';
import '../add_transaction/add_transaction_cubit.dart';
import '../animateContainer/animate_container_cubit.dart';
import '../get_transactions_per_day/get_transactions_per_day_cubit.dart';

part 'update_transaction_state.dart';

class UpdateTransactionCubit extends Cubit<UpdateTransactionState> {
  UpdateTransactionCubit({required this.editTransaction}) : super(UpdateTransactionInitial());

  final EditTransaction editTransaction;


  late String amount;
  late String description;

  void updateTransaction(TransactionEntitie transactionEntitie,BuildContext context)async{

   final result = await editTransaction.call(Params(transaction: transactionEntitie,description: description,
      dateTime: BlocProvider.of<AddTransactionCubit>(context).selectedDate,amount: amount));

   result.fold((l) => print(l), (r) {
     BlocProvider.of<GetTransactionsPerDayCubit>(context).getTransactionsPerDay(transactionEntitie.date);
     BlocProvider.of<AnimateContainerCubit>(context).isEditing = false;
     BlocProvider.of<AnimateContainerCubit>(context).pressedIndex = -1;

   });


  }



  }

