import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:track_cash/core/error/Failure.dart';
import 'package:track_cash/core/usecases/usecase.dart';
import '../entities/transaction.dart';
import '../repository/transaction_repository.dart';

class AddTransaction implements UseCase<bool,Params>{

  final TransactionRepository transactionRepository;

  AddTransaction({required this.transactionRepository});

  @override
  Future<Either<Failure,bool>> call(Params params)async{

    return await transactionRepository.addTransaction(params.transactionType,params.amount,params.dateTime,params.description);

  }

}

class Params extends Equatable{

  final TransactionType transactionType;
  final DateTime dateTime;
  final double amount;
  final String description;
  const Params({required this.transactionType,required this.dateTime,required this.amount,required this.description});

  @override
  List<Object?> get props => [transactionType,dateTime,amount];

}