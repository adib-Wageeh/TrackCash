import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:track_cash/core/error/Failure.dart';
import 'package:track_cash/core/usecases/usecase.dart';
import '../entities/transaction.dart';
import '../repository/transaction_repository.dart';

class GetTransactionInMonth implements UseCase<List<Transaction>,Params>{

  final TransactionRepository transactionRepository;

  GetTransactionInMonth({required this.transactionRepository});

  @override
  Future<Either<Failure,List<Transaction>>?> call(Params params)async{

    return await transactionRepository.getTransactionsInMonth(params.dateTime);

  }

}

class Params extends Equatable{

  DateTime dateTime;
  Params({required this.dateTime});

  @override
  List<Object?> get props => [dateTime];

}