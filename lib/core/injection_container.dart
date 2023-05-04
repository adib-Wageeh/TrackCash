import 'package:get_it/get_it.dart';
import 'package:track_cash/features/calender_transactions/domain/usecases/get_transactions_in_month.dart';
import 'package:track_cash/features/calender_transactions/domain/usecases/get_transactions_total_amount.dart';
import 'package:track_cash/features/calender_transactions/domain/usecases/remove_transaction.dart';
import '../features/calender_transactions/data/dataSources/local_data_source.dart';
import '../features/calender_transactions/data/dataSources/transactions_datasource.dart';
import '../features/calender_transactions/data/repository/transaction_repository_impl.dart';
import '../features/calender_transactions/domain/repository/transaction_repository.dart';
import '../features/calender_transactions/domain/usecases/add_transaction.dart';
import '../features/calender_transactions/domain/usecases/edit_transaction.dart';
import '../features/calender_transactions/domain/usecases/get_transaction_in_day.dart';

final getIt = GetIt.instance;

void init(){

  getIt.registerSingleton<TransactionDatasource>(LocalDataSource());
  getIt.registerSingleton<TransactionRepository>(TransactionRepositoryImplementation(transactionDatasource: getIt()));

  getIt.registerSingleton(AddTransaction(transactionRepository: getIt()));
  getIt.registerSingleton(EditTransaction(transactionRepository: getIt()));
  getIt.registerSingleton(RemoveTransaction(transactionRepository: getIt()));
  getIt.registerSingleton(GetTransactionInDay(transactionRepository: getIt()));
  getIt.registerSingleton(GetTransactionInMonth(transactionRepository: getIt()));
  getIt.registerSingleton<GetTransactionTotalAmount>(GetTransactionTotalAmount());

}