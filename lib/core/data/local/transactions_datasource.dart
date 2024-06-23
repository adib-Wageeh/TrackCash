import 'package:track_cash/core/data/model/transaction.dart';
import '../../../../core/data/model/transaction_model.dart';

abstract class TransactionDatasource{

  Future<int> addTransaction(TransactionType transactionType,double amount,DateTime dateTime,String description);
  Future<int> removeTransaction(TransactionModel transaction);
  Future<int> editTransaction(TransactionModel transaction);
  Future<List<Map<String,dynamic>>> getTransactionsInDay(DateTime dateTime);
  Future<List<Map<String,dynamic>>> getTransactionsInMonth(DateTime dateTime);

}