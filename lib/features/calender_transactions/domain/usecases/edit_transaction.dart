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

    return await transactionRepository.addTransaction(params.transaction);

  }

}

class Params extends Equatable{

  TransactionEntitie transaction;
  Params({required this.transaction});

  @override
  List<Object?> get props => [transaction];

}