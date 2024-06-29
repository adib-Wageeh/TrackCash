import 'package:track_cash/core/data/model/transaction.dart';

class TransactionTypeTotal{

  double amount;
  TransactionEntity transactionEntity;

  TransactionTypeTotal({required this.transactionEntity,required this.amount});


  TransactionTypeTotal copyWith({
      double? amount,
      TransactionEntity? transactionEntity}) {
    return TransactionTypeTotal(
        amount: amount ?? this.amount,
        transactionEntity: transactionEntity ?? this.transactionEntity);

  }

}