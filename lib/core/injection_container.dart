import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:track_cash/core/data/local/transactions_datasource.dart';
import 'package:track_cash/ui/screens/add_transaction/repository/add_transaction_repository.dart';
import 'package:track_cash/ui/screens/add_transaction/repository/add_transaction_repository_impl.dart';
import 'package:track_cash/ui/screens/calender/repository/calendar_repository.dart';
import 'package:track_cash/ui/screens/calender/repository/calendar_repository_impl.dart';
import 'package:track_cash/ui/screens/report/repository/report_repository.dart';
import 'package:track_cash/ui/screens/report/repository/report_repository_impl.dart';
import 'data/local/local_data_source.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await getIt..registerSingletonAsync<SharedPreferences>(() async{
    return SharedPreferences.getInstance();
  })..registerSingletonAsync<Database>(() async {
      final path = await getDatabasesPath();
      final databasePath = await join(path, "transactions.db");
      Database myDb = await openDatabase(
        databasePath,
        onCreate: _onCreate,
        version: 1,
        onUpgrade: _onUpgrade,
      );
      print('Database initialized');
      return myDb;
    })
    ..registerSingletonWithDependencies<TransactionDatasource>(
          () => LocalDataSource(db: getIt.get<Database>()),
      dependsOn: [Database],
    )
    ..registerSingletonWithDependencies<CalendarRepository>(
          () => CalendarRepositoryImplementation(),
      dependsOn: [TransactionDatasource],
    )
    ..registerSingletonWithDependencies<AddTransactionRepository>(
          () => AddTransactionRepositoryImplementation(),
      dependsOn: [TransactionDatasource],
    )
    ..registerSingletonWithDependencies<ReportRepository>(
          () => ReportRepositoryImplementation(),
      dependsOn: [TransactionDatasource],
    );
}


Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async{
  if (oldVersion < newVersion) {
    db.execute(
        "ALTER TABLE transactions ADD COLUMN description TEXT NOT NULL;");
  }
}

Future<void> _onCreate(Database db, int version) async {
  await db.execute('''
    CREATE TABLE transactions (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    category TEXT NOT NULL,
    type INTEGER NOT NULL,
    day INTEGER NOT NULL,
    month INTEGER NOT NULL,
    year INTEGER NOT NULL,    
    amount TEXT NOT NULL,
    description TEXT NOT NULL,
    transactionTypeId INTEGER NOT NULL
    )
    ''');
}

Future<void> _dropTable(Database db, String tableName) async {
  try {
    await db.execute('DROP TABLE IF EXISTS $tableName');
    print('Table $tableName dropped successfully.');
  } catch (e) {
    print('Error occurred while dropping table $tableName: $e');
  }
}
