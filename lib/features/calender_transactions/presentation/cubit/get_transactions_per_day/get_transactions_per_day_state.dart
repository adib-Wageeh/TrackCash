part of 'get_transactions_per_day_cubit.dart';

@immutable
abstract class GetTransactionsPerDayState {}

class GetTransactionsPerDayInitial extends GetTransactionsPerDayState {}
class GetTransactionsPerDayLoading extends GetTransactionsPerDayState {
  final DateTime selectedDay;
  GetTransactionsPerDayLoading({required this.selectedDay});
}

class GetTransactionsPerDayLoaded extends GetTransactionsPerDayState {
  final List<TransactionEntitie> transactions;
  final DateTime selectedDay;
  GetTransactionsPerDayLoaded({required this.transactions,required this.selectedDay});
}

class GetTransactionsPerDayError extends GetTransactionsPerDayState {
  final String error;
  GetTransactionsPerDayError({required this.error});
}

