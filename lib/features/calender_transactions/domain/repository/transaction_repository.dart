import 'package:dartz/dartz.dart';
import 'package:track_cash/core/error/Failure.dart';

import '../entities/transaction.dart';

abstract class TransactionRepository{

  Future<Either<Failure,bool>> addTransaction(Transaction transaction);
  Future<Either<Failure,bool>> removeTransaction(Transaction transaction);
  Future<Either<Failure,bool>> editTransaction(Transaction transaction);
  Future<Either<Failure,List<Transaction>>>? getTransactionsInDay(DateTime? dateTime);
  Future<Either<Failure,List<Transaction>>> getTransactionsInMonth(DateTime dateTime);

}