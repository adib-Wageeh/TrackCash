import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:track_cash/core/data/local/transactions_datasource.dart';
import 'package:track_cash/core/error/Failure.dart';
import 'package:track_cash/core/data/model/transaction.dart';
import 'add_transaction_repository.dart';

class AddTransactionRepositoryImplementation extends AddTransactionRepository{

  late final TransactionDatasource transactionDatasource;

  CalendarRepositoryImplementation({TransactionDatasource? transactionDatasource}) {
    transactionDatasource = transactionDatasource ?? GetIt.I.get<TransactionDatasource>();
  }

  @override
  Future<Either<Failure, bool>> addTransaction(TransactionType transactionType,double amount,DateTime dateTime,String description) async{
    try {
      await transactionDatasource.addTransaction(transactionType,amount,dateTime,description);
        return const Right(true);
    }catch(e) {
    return Left(LocalDatabaseFailure(e.toString()));
  }
  }


}