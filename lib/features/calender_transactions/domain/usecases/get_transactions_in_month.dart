import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:track_cash/core/error/Failure.dart';
import 'package:track_cash/core/usecases/usecase.dart';
import '../entities/transaction_type_total.dart';
import '../repository/transaction_repository.dart';

class GetTransactionInMonth implements UseCase<List<TransactionTypeTotal>,Params>{

  final TransactionRepository transactionRepository;

  GetTransactionInMonth({required this.transactionRepository});

  @override
  Future<Either<Failure,List<TransactionTypeTotal>>> call(Params params)async{

    List<TransactionTypeTotal> transactions = [];
    final result = await transactionRepository.getTransactionsInMonth(params.dateTime);

    return result.fold((l) {
      return Left(l);
    }, (r) {
      for (var transaction in r) {
        if (transactions.every((element) =>
        (element.type.category != transaction.type.category))) {
          // category has not been added yet
          transactions.add(TransactionTypeTotal(
          imagePath: transaction.imagePath
          ,amount: transaction.amount,
              type: transaction.type,
              transactions: [transaction],
              color: transaction.color));
        } else {
          for (var e in transactions) {
            if (e.type.category == transaction.type.category) {
              e.amount += transaction.amount;
              e.transactions.add(transaction);
            }
          }
        }
      }
      return Right(transactions);
    });

  }
}

class Params extends Equatable{

  final DateTime dateTime;
  const Params({required this.dateTime});

  @override
  List<Object?> get props => [dateTime];

}