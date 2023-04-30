import '../../domain/entities/transaction.dart';

abstract class TransactionDatasource{

  Future<bool> addTransaction(Transaction transaction);
  Future<bool> removeTransaction(Transaction transaction);
  Future<bool> editTransaction(Transaction transaction);
  Future<Transaction> getTransactionsInDay(DateTime? dateTime);
  Future<Transaction> getTransactionsInMonth(DateTime dateTime);

}