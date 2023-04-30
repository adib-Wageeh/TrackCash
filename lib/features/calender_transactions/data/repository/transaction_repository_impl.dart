
import 'package:dartz/dartz.dart';

import 'package:track_cash/core/error/Failure.dart';

import 'package:track_cash/features/calender_transactions/domain/entities/transaction.dart';

import '../../domain/repository/transaction_repository.dart';

class TransactionRepositoryImplementation implements TransactionRepository{
  @override
  Future<Either<Failure, bool>> addTransaction(Transaction transaction) {
    // TODO: implement addTransaction
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> editTransaction(Transaction transaction) {
    // TODO: implement editTransaction
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Transaction>>>? getTransactionsInDay(DateTime? dateTime) {
    // TODO: implement getTransactionsInDay
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Transaction>>> getTransactionsInMonth(DateTime dateTime) {
    // TODO: implement getTransactionsInMonth
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> removeTransaction(Transaction transaction) {
    // TODO: implement removeTransaction
    throw UnimplementedError();
  }
  

}