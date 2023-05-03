import 'package:dartz/dartz.dart';
import 'package:track_cash/core/error/Failure.dart';
import '../entities/transaction.dart';

abstract class TransactionRepository{

  Future<Either<Failure,bool>> addTransaction(TransactionType transactionType,double amount,DateTime dateTime,String description);
  Future<Either<Failure,bool>> removeTransaction(TransactionEntitie transaction);
  Future<Either<Failure,bool>> editTransaction(TransactionEntitie transaction,String amount,String desc,DateTime dateTime);
  Future<Either<Failure,List<TransactionEntitie>>> getTransactionsInDay(DateTime dateTime);
  Future<Either<Failure,List<TransactionEntitie>>> getTransactionsInMonth(DateTime dateTime);

}