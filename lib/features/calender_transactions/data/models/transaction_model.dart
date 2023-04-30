
import '../../domain/entities/transaction.dart';

class TransactionModel extends Transaction{

  const TransactionModel({required TransactionType type,required double amount,required DateTime date}):super(type: type,date: date,amount: amount);

}