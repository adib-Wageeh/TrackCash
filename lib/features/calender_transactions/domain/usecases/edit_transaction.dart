import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:track_cash/core/error/Failure.dart';
import 'package:track_cash/core/usecases/usecase.dart';
import '../entities/transaction.dart';
import '../repository/transaction_repository.dart';

class EditTransaction implements UseCase<bool,Params>{

  final TransactionRepository transactionRepository;

  EditTransaction({required this.transactionRepository});

  @override
  Future<Either<Failure,bool>> call(Params params)async{

    return await transactionRepository.editTransaction(params.transaction,params.amount,params.description,params.dateTime);

  }

}

class Params extends Equatable{

  final TransactionEntitie transaction;
  final String amount;
  final String description;
  final DateTime dateTime;
  const Params({required this.transaction,required this.dateTime,required this.amount,required this.description});

  @override
  List<Object?> get props => [transaction];

}