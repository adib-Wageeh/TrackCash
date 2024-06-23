import 'package:dartz/dartz.dart';
import 'package:track_cash/core/data/model/transaction.dart';
import 'package:track_cash/core/error/Failure.dart';

abstract class CalendarRepository{

  Future<Either<Failure,bool>> editTransaction(TransactionEntity transaction,String amount,String desc,DateTime dateTime);
  Future<Either<Failure,List<TransactionEntity>>> getTransactionsInDay(DateTime dateTime);
  Future<Either<Failure,bool>> removeTransaction(TransactionEntity transaction);

}