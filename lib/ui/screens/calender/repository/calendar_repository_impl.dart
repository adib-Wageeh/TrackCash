import 'package:dartz/dartz.dart';
import 'package:track_cash/core/data/local/transactions_datasource.dart';
import 'package:track_cash/core/data/model/transaction_model.dart';
import 'package:track_cash/core/error/Failure.dart';
import 'package:track_cash/core/data/model/transaction.dart';
import 'package:track_cash/core/injection_container.dart';
import 'calendar_repository.dart';

class CalendarRepositoryImplementation extends CalendarRepository {
  late final TransactionDatasource transactionDatasource;

  CalendarRepositoryImplementation(
      {TransactionDatasource? transactionDatasource}) {
    this.transactionDatasource =
        transactionDatasource ?? getIt.get<TransactionDatasource>();
  }

  @override
  Future<Either<Failure, bool>> editTransaction(TransactionEntity transaction,
      String amount, String desc, DateTime dateTime) async {
    try {
      TransactionModel transactionModel = TransactionModel(
        description: desc,
        type: transaction.type,
        amount: double.parse(amount),
        date: dateTime,
        id: transaction.id,
      );
      await transactionDatasource.editTransaction(transactionModel);
      return const Right(true);
    } catch (e) {
      return Left(LocalDatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntity>>> getTransactionsInDay(
      DateTime dateTime) async {
    try {
      List<Map<String, dynamic>> result =
          await transactionDatasource.getTransactionsInDay(dateTime);
      List<TransactionModel> transactions = result.map((e) {
        return TransactionModel.fromJson(e);
      }).toList();
      return Right(transactions);
    } catch (e) {
      return Left(LocalDatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> removeTransaction(
      TransactionEntity transaction) async {
    try {
      TransactionModel transactionModel = TransactionModel(
          description: transaction.description,
          type: transaction.type,
          amount: transaction.amount,
          date: transaction.date,
          id: transaction.id);
      await transactionDatasource.removeTransaction(transactionModel);
      return const Right(true);
    } catch (e) {
      return Left(LocalDatabaseFailure(e.toString()));
    }
  }
}
