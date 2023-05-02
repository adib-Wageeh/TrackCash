import 'package:track_cash/features/calender_transactions/domain/entities/transaction.dart';

import '../models/transaction_model.dart';

abstract class TransactionDatasource{

  Future<int> addTransaction(TransactionType transactionType,double amount,DateTime dateTime);
  Future<int> removeTransaction(TransactionModel transaction);
  Future<int> editTransaction(TransactionModel transaction);
  Future<List<Map<String,dynamic>>> getTransactionsInDay(DateTime dateTime);
  Future<List<Map<String,dynamic>>> getTransactionsInMonth(DateTime dateTime);

}