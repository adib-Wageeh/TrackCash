import 'package:dartz/dartz.dart';
import 'package:track_cash/core/data/model/transaction.dart';
import 'package:track_cash/core/error/Failure.dart';

abstract class ReportRepository{

  Future<Either<Failure,List<TransactionEntity>>> getTransactionsInMonth(DateTime dateTime);

}