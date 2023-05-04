import 'package:dartz/dartz.dart';
import 'package:track_cash/core/error/Failure.dart';
import 'package:track_cash/features/calender_transactions/domain/entities/transaction.dart';
import '../../domain/repository/transaction_repository.dart';
import '../dataSources/transactions_datasource.dart';
import '../models/transaction_model.dart';

class TransactionRepositoryImplementation implements TransactionRepository{

  TransactionDatasource transactionDatasource;

  TransactionRepositoryImplementation({required this.transactionDatasource});

  @override
  Future<Either<Failure, bool>> addTransaction(TransactionType transactionType,double amount,DateTime dateTime,String description) async{

    try {
      await transactionDatasource.addTransaction(transactionType,amount,dateTime,description);
        return const Right(true);
    }catch(e) {
    return Left(LocalDatabaseFailure(e.toString()));
  }
  }

  @override
  Future<Either<Failure, bool>> editTransaction(TransactionEntitie transaction,String amount,String desc,DateTime dateTime) async{

    try{
    TransactionModel transactionModel = TransactionModel(description: desc,type: transaction.type, amount: double.parse(amount), date: dateTime, id: transaction.id,imagePath: transaction.imagePath,color: transaction.color);
    await transactionDatasource.editTransaction(transactionModel);
      return const Right(true);
    }catch(e) {
    return Left(LocalDatabaseFailure(e.toString()));
  }
  }

  @override
  Future<Either<Failure, List<TransactionEntitie>>> getTransactionsInDay(DateTime dateTime)async{

    try{
    List<Map<String, dynamic>> result = await transactionDatasource.getTransactionsInDay(dateTime);
    List<TransactionModel> transactions = result.map((e) {
     return TransactionModel.fromJson(e);
    }).toList();
    return Right(transactions);
    }catch(e){
      return Left(LocalDatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntitie>>> getTransactionsInMonth(DateTime dateTime) async{

    try{
      List<Map<String, dynamic>> result = await transactionDatasource.getTransactionsInMonth(dateTime);
      List<TransactionModel> transactions = result.map((e) {
        return TransactionModel.fromJson(e);
      }).toList();
      return Right(transactions);
    }catch(e){
      return Left(LocalDatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> removeTransaction(TransactionEntitie transaction)async{
    try{
      TransactionModel transactionModel = TransactionModel(description: transaction.description,type: transaction.type, amount: transaction.amount, date: transaction.date, id: transaction.id,color: transaction.color,imagePath: transaction.imagePath);
      await transactionDatasource.removeTransaction(transactionModel);
      return const Right(true);
    }catch(e) {
      return Left(LocalDatabaseFailure(e.toString()));
    }
  }
  

}