import 'package:dartz/dartz.dart';
import 'package:track_cash/core/data/local/transactions_datasource.dart';
import 'package:track_cash/core/error/Failure.dart';
import 'package:track_cash/core/data/model/transaction.dart';
import 'package:track_cash/core/injection_container.dart';
import 'add_transaction_repository.dart';

class AddTransactionRepositoryImplementation extends AddTransactionRepository{

  late final TransactionDatasource transactionDatasource;

  AddTransactionRepositoryImplementation({TransactionDatasource? transactionDatasource}) {
    this.transactionDatasource = transactionDatasource ?? getIt.get<TransactionDatasource>();
  }

  @override
  Future<Either<Failure, bool>> addTransaction(TransactionType transactionType,double amount,DateTime dateTime,String description) async{
    try {
      print('ssss');
      print(transactionDatasource.hashCode);
      await transactionDatasource.addTransaction(transactionType,amount,dateTime,description);
        return const Right(true);
    }catch(e) {
    return Left(LocalDatabaseFailure(e.toString()));
  }
  }


}