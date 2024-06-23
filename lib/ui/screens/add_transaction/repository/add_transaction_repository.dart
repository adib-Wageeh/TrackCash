import 'package:dartz/dartz.dart';
import 'package:track_cash/core/data/model/transaction.dart';
import 'package:track_cash/core/error/Failure.dart';

abstract class AddTransactionRepository{

  Future<Either<Failure,bool>> addTransaction(TransactionType transactionType,double amount,DateTime dateTime,String description);

}