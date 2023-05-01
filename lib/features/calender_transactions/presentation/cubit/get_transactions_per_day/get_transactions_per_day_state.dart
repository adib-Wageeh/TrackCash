part of 'get_transactions_per_day_cubit.dart';

@immutable
abstract class GetTransactionsPerDayState {}

class GetTransactionsPerDayInitial extends GetTransactionsPerDayState {}
class GetTransactionsPerDayLoading extends GetTransactionsPerDayState {}

class GetTransactionsPerDayLoaded extends GetTransactionsPerDayState {
  final List<TransactionEntitie> transactions;
  GetTransactionsPerDayLoaded({required this.transactions});
}

class GetTransactionsPerDayError extends GetTransactionsPerDayState {
  final String error;
  GetTransactionsPerDayError({required this.error});
}

