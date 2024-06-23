import 'package:track_cash/core/data/local/transactions_datasource.dart';
import 'package:sqflite/sqflite.dart';
import 'package:track_cash/core/data/model/transaction.dart';
import '../model/transaction_model.dart';

class LocalDataSource implements TransactionDatasource {

  Database db;
  LocalDataSource({required this.db});

  @override
  Future<int> addTransaction(TransactionType transactionType, double amount,
      DateTime dateTime, String description) async {
    Database dbRef = await db;
    int result = await dbRef.rawInsert('''
    INSERT INTO transactions(category,type,day,month,year,amount,description) VALUES 
    ("${transactionType.category}","${transactionType.type}",
    "${dateTime.day}","${dateTime.month}","${dateTime.year}",${amount.toString()},
    "${description.toString()}"
    )
    ''');
    return result;
  }

  @override
  Future<int> editTransaction(TransactionModel transaction) async {
    Database dbRef = await db;
    int result = await dbRef.rawUpdate('''
    UPDATE transactions SET category = "${transaction.type.category}",
    type = "${transaction.type.type}",
    day = "${transaction.date.day}",
    month = "${transaction.date.month}",
    year = "${transaction.date.year}",
    amount = "${transaction.amount.toString()}",
    description = "${transaction.description}" WHERE id = "${transaction.id}"
    ''');
    return result;
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactionsInDay(
      DateTime dateTime) async {
    Database dbRef = await db;
    List<Map<String, dynamic>> result = await dbRef.rawQuery('''
    SELECT * FROM transactions WHERE year = "${dateTime.year}" AND month = "${dateTime.month}" AND day = "${dateTime.day}"
       ''');
    return result;
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactionsInMonth(
      DateTime dateTime) async {
    Database dbRef = await db;
    List<Map<String, dynamic>> result = await dbRef.rawQuery('''
    SELECT * FROM transactions WHERE year= "${dateTime.year}" AND month= "${dateTime.month}"
       ''');
    return result;
  }

  @override
  Future<int> removeTransaction(TransactionModel transaction) async {
    Database dbRef = await db;
    int result = await dbRef.rawDelete('''
    DELETE FROM transactions WHERE id = "${transaction.id}"
       ''');
    return result;
  }
}
