import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:track_cash/features/calender_transactions/domain/usecases/get_transactions_in_month.dart';

import '../../../domain/entities/transaction.dart';

part 'get_transactions_per_month_state.dart';

class GetTransactionsPerMonthCubit extends Cubit<GetTransactionsPerMonthState> {
  GetTransactionsPerMonthCubit({required this.getTransactionInMonth}) : super(GetTransactionsPerMonthInitial());

  GetTransactionInMonth getTransactionInMonth;

  getTransactionsPerMonth(DateTime dateTime)async{
    emit(GetTransactionsPerMonthLoading());
    final result = await getTransactionInMonth.call(Params(dateTime: dateTime));
    result.fold((error){
      emit(GetTransactionsPerMonthError(error: error.error));
    },(transactions){
      emit(GetTransactionsPerMonthLoaded(transactions: transactions));
    });
  }

}
