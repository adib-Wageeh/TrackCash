import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:track_cash/core/data/local/transactions_datasource.dart';
import 'package:track_cash/ui/screens/add_transaction/repository/add_transaction_repository.dart';
import 'package:track_cash/ui/screens/add_transaction/repository/add_transaction_repository_impl.dart';
import 'package:track_cash/ui/screens/calender/repository/calendar_repository.dart';
import 'package:track_cash/ui/screens/calender/repository/calendar_repository_impl.dart';
import 'package:track_cash/ui/screens/report/repository/report_repository.dart';
import 'package:track_cash/ui/screens/report/repository/report_repository_impl.dart';
import 'package:track_cash/ui/screens/settings/domain/use_case/theme_use_case.dart';
import 'data/local/local_data_source.dart';


final getIt = GetIt.instance;

Future<void> init() async {
  getIt
    ..registerSingletonAsync<Database>(() async {
      final path = await getDatabasesPath();
      final databasePath = await join(path, "transactions.db");
      Database myDb = await openDatabase(databasePath,
          onCreate: _onCreate, version: 4, onUpgrade: _onUpgrade);
      return myDb;
    })
    ..registerSingletonWithDependencies<TransactionDatasource>(
        () => LocalDataSource(
              db: getIt.get<Database>(),
            ),
        dependsOn: [Database])
    ..registerSingletonWithDependencies<CalendarRepository>(
        () => CalendarRepositoryImplementation(),
        dependsOn: [TransactionDatasource])
    ..registerSingletonWithDependencies<AddTransactionRepository>(
        () => AddTransactionRepositoryImplementation(),
        dependsOn: [TransactionDatasource])
    ..registerSingletonWithDependencies<ReportRepository>(
        () => ReportRepositoryImplementation(),
        dependsOn: [TransactionDatasource])
    ..registerSingleton(ThemeUseCase());
}

void _onUpgrade(Database db, int oldVersion, int newVersion) {
  if (oldVersion < newVersion) {
    db.execute(
        "ALTER TABLE transactions ADD COLUMN description TEXT NOT NULL;");
  }
}

void _onCreate(Database db, int version) async {
  await db.execute('''
    CREATE TABLE transactions (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    category TEXT NOT NULL,
    type INTEGER NOT NULL,
    day INTEGER NOT NULL,
    month INTEGER NOT NULL,
    year INTEGER NOT NULL,    
    amount TEXT NOT NULL,
    description TEXT NOT NULL
    )
    ''');
}
