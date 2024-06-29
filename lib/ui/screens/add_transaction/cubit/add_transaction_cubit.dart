import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_cash/core/data/model/transaction.dart';
import 'package:track_cash/core/injection_container.dart';
import 'package:track_cash/ui/screens/add_transaction/cubit/add_transaction_state.dart';
import 'package:track_cash/ui/screens/add_transaction/repository/add_transaction_repository.dart';

class AddTransactionCubit extends Cubit<AddTransactionState> {
  static AddTransactionCubit get(BuildContext context) =>
      BlocProvider.of(context);

  late final AddTransactionRepository _addTransactionRepository;
  bool transactionAdded = false;

  AddTransactionCubit({
    AddTransactionRepository? addTransactionRepository,
  }) : super(const AddTransactionState.initial()) {
    _addTransactionRepository =
        addTransactionRepository ?? getIt.get<AddTransactionRepository>();
  }

  Future<void> addTransaction(
      {required double amount,
      required DateTime selectedDate,
      required TransactionType transactionType,
      String? description
      }) async {
    emit(AddTransactionState.loading());
    final response = await _addTransactionRepository.addTransaction(
        transactionType,amount,selectedDate,description??"");
    response.fold((error){
      emit(AddTransactionState.error(error));
    }, (_){
      transactionAdded = true;
      emit(AddTransactionState.success());
    });

  }
}
