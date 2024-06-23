import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:track_cash/core/data/local/transactions_datasource.dart';
import 'package:track_cash/core/data/model/transaction_model.dart';
import 'package:track_cash/core/error/Failure.dart';
import 'package:track_cash/core/data/model/transaction.dart';
import 'package:track_cash/ui/screens/report/repository/report_repository.dart';

class ReportRepositoryImplementation extends ReportRepository {
  late final TransactionDatasource transactionDatasource;

  CalendarRepositoryImplementation(
      {TransactionDatasource? transactionDatasource}) {
    transactionDatasource =
        transactionDatasource ?? GetIt.I.get<TransactionDatasource>();
  }

  @override
  Future<Either<Failure, List<TransactionEntity>>> getTransactionsInMonth(DateTime dateTime) async{
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

}