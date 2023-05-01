part of 'add_transaction_cubit.dart';

@immutable
abstract class AddTransactionState {}

class AddTransactionInitial extends AddTransactionState {}

class AddTransactionLoading extends AddTransactionState {}

class AddTransactionError extends AddTransactionState {
  final String error;
  AddTransactionError({required this.error});
}

class AddTransactionDone extends AddTransactionState {}
