import '../models/transaction_model.dart';

abstract class TransactionDatasource{

  Future<int> addTransaction(TransactionModel transaction);
  Future<int> removeTransaction(TransactionModel transaction);
  Future<int> editTransaction(TransactionModel transaction);
  Future<List<Map<String,dynamic>>> getTransactionsInDay(DateTime dateTime);
  Future<List<Map<String,dynamic>>> getTransactionsInMonth(DateTime dateTime);

}