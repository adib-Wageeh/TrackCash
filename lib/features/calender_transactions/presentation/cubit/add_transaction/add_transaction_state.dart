part of 'add_transaction_cubit.dart';

@immutable
abstract class AddTransactionState {}

class AddTransactionInitial extends AddTransactionState {}

class AddTransactionExpense extends AddTransactionState {
  final List list;
  final Map<String,dynamic> images;
  AddTransactionExpense({required this.list,required this.images});
}
class AddTransactionIncome extends AddTransactionState {
  final List list;
  final Map<String,dynamic> images;
  AddTransactionIncome({required this.list,required this.images});
}

class AddTransactionLoading extends AddTransactionState {}

class AddTransactionError extends AddTransactionState {
  final String error;
  AddTransactionError({required this.error});
}

class AddTransactionDone extends AddTransactionState {}

