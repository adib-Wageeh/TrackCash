import 'package:path/path.dart';
import 'package:track_cash/features/calender_transactions/data/dataSources/transactions_datasource.dart';
import 'package:sqflite/sqflite.dart';
import '../models/transaction_model.dart';

class LocalDataSource implements TransactionDatasource{


static Database? _db;

Future<Database> get db async => _db ??= await initDb();


initDb()async{
final path = await getDatabasesPath();
final databasePath = join(path,"transactions.db");
Database myDb = await openDatabase(databasePath,onCreate: _onCreate,version: 1);
return myDb;
}

void _onCreate(Database db,int version)async{
    await db.execute('''
    CREATE TABLE transactions (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    category TEXT NOT NULL,
    type INTEGER NOT NULL,
    day INTEGER NOT NULL,
    month INTEGER NOT NULL,
    year INTEGER NOT NULL,    
    amount TEXT NOT NULL
    )
    ''');
}

  @override
  Future<int> addTransaction(TransactionModel transaction) async{
    Database dbRef = await db;
    int result = await dbRef.rawInsert('''
    INSERT INTO transactions(category,type,day,month,year,amount) VALUES 
    (${transaction.type.category},${transaction.type.type},${transaction.date.day},${transaction.date.month},${transaction.date.year},${transaction.amount.toString()})
    ''');
    return result;
  }

  @override
  Future<int> editTransaction(TransactionModel transaction) async{
    Database dbRef = await db;
    int result = await dbRef.rawUpdate('''
    UPDATE transactions transactions(category,type,day,month,year,amount) VALUES 
    (${transaction.type.category},${transaction.type.type},${transaction.date.day},${transaction.date.month},${transaction.date.year},${transaction.amount.toString()})
    ''');
    return result;
  }

  @override
  Future<List<Map<String,dynamic>>> getTransactionsInDay(DateTime dateTime) async{
    Database dbRef = await db;
    List<Map<String,dynamic>> result = await dbRef.rawQuery('''
    SELECT * FROM transactions WHERE 'year'= ${dateTime.year} AND 'month'= ${dateTime.month} AND 'day'= ${dateTime.day}     
       ''');
    return result;
  }

  @override
  Future<List<Map<String,dynamic>>> getTransactionsInMonth(DateTime dateTime) async{
    Database dbRef = await db;
    List<Map<String,dynamic>> result = await dbRef.rawQuery('''
    SELECT * FROM transactions WHERE 'year'= ${dateTime.year} AND 'month'= ${dateTime.month}    
       ''');
    return result;
  }

  @override
  Future<int> removeTransaction(TransactionModel transaction) async{
    Database dbRef = await db;
    int result = await dbRef.rawDelete('''
    REMOVE FROM transactions WHERE 'id' = ${transaction.id}  
       ''');
    return result;
  }



}