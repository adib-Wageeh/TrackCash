import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/transaction.dart';
import '../../../domain/usecases/get_transaction_in_day.dart';

part 'get_transactions_per_day_state.dart';

class GetTransactionsPerDayCubit extends Cubit<GetTransactionsPerDayState> {
  GetTransactionsPerDayCubit({required this.getTransactionInDay}) : super(GetTransactionsPerDayInitial());

  GetTransactionInDay getTransactionInDay;
  DateTime selectedDay = DateTime.now();

  getTransactionsPerDay(DateTime dateTime)async{

    emit(GetTransactionsPerDayLoading(selectedDay: selectedDay));
    selectedDay = dateTime;
    final result = await getTransactionInDay.call(Params(dateTime: dateTime));
    result.fold((error)=> emit(GetTransactionsPerDayError(error: error.error))
    ,(transactions)=> emit(GetTransactionsPerDayLoaded(transactions: transactions,selectedDay:selectedDay)));
  }

}
