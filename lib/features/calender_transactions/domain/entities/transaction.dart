import 'package:equatable/equatable.dart';
import '../../../../core/enums/enums.dart';

class Transaction extends Equatable{

  final double amount;
  final TransactionType type;
  final DateTime date;

  const Transaction({required this.type,required this.date,required this.amount});

  @override
  List<Object?> get props => [
    amount,
    type,
    date,
  ];

}


class TransactionType{

  late final String category;
  late final int type;

  TransactionType({required this.type,required this.category});

  factory TransactionType.add(dynamic transaction){

    if(transaction is Income){
      return TransactionType(type: 1,category: transaction.categoryType.toString());
    }else {
      return TransactionType(type: 2,category: (transaction as Expense).category.toString());
    }
  }
}

class Income{

  final IncomeCategory categoryType;
  Income({required this.categoryType});
}


class Expense {

  final ExpenseCategory category;
  Expense({required this.category});
}
