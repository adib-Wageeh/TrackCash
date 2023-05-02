
import '../../domain/entities/transaction.dart';

class TransactionModel extends TransactionEntitie{



  const TransactionModel({required TransactionType type,required double amount,required DateTime date,required int id}):super(type: type,date: date,amount: amount,id: id);

  TransactionModel copyWith(TransactionType? newTransactionType,double? newAmount,DateTime? dateTime){
    return TransactionModel(type: newTransactionType ?? super.type, amount: newAmount??super.amount, date: dateTime??super.date,id:super.id);
  }

  factory TransactionModel.fromJson(Map<String,dynamic> json){
    return TransactionModel(type: TransactionType(type: json['type'],category: json['category']),
        amount: double.parse(json['amount']),
        date: DateTime(json['year'],json['month'],json['day']), id: json['id']);
  }



}