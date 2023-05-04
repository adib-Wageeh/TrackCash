import '../entities/transaction_type_total.dart';

class GetTransactionTotalAmount {

  GetTransactionTotalAmount();

  double getAmount(List<TransactionTypeTotal> params){

    double total = 0;
    for (var element in params) {
      total += element.amount;
    }
    return total;
  }
}
