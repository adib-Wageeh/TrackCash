import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:track_cash/features/calender_transactions/domain/entities/transaction.dart';

import '../../../domain/usecases/add_transaction.dart';

part 'add_transaction_state.dart';

class AddTransactionCubit extends Cubit<AddTransactionState> {
  AddTransactionCubit({required this.addTransaction}) : super(AddTransactionInitial());

  AddTransaction addTransaction;

  void addTransactionMethod(TransactionEntitie transactionEntitie)async{

    emit(AddTransactionLoading());
    final result = await addTransaction.call(Params(transaction: transactionEntitie));
    result.fold((error){
      emit(AddTransactionError(error: error.error));
    },(transactions){
      emit(AddTransactionDone());
    });
  }

}
