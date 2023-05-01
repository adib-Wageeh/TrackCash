part of 'get_transactions_per_month_cubit.dart';

@immutable
abstract class GetTransactionsPerMonthState {}

class GetTransactionsPerMonthInitial extends GetTransactionsPerMonthState {}

class GetTransactionsPerMonthLoading extends GetTransactionsPerMonthState {}

class GetTransactionsPerMonthLoaded extends GetTransactionsPerMonthState {
  final List<TransactionEntitie> transactions;
  GetTransactionsPerMonthLoaded({required this.transactions});
}

class GetTransactionsPerMonthError extends GetTransactionsPerMonthState {
  final String error;
  GetTransactionsPerMonthError({required this.error});
}