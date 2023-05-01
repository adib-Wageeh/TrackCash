import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:track_cash/core/enums/enums.dart';
import 'package:track_cash/features/calender_transactions/domain/entities/transaction.dart';
import 'package:track_cash/features/calender_transactions/domain/repository/transaction_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:track_cash/features/calender_transactions/domain/usecases/get_transaction_in_day.dart';

class MockTransactionRepository extends Mock implements TransactionRepository{}

void main(){

  late GetTransactionInDay usecase;
  late MockTransactionRepository mockTransactionRepository;

  setUp((){
  mockTransactionRepository = MockTransactionRepository();
  usecase = GetTransactionInDay(transactionRepository:mockTransactionRepository);
  });

  List<TransactionEntitie> transactions = [
    TransactionEntitie(type: TransactionType.add(Income(categoryType: IncomeCategory.salary)), date: DateTime(2023,4,29), amount: 2000),
    TransactionEntitie(type: TransactionType.add(Expense(category: ExpenseCategory.food)), date: DateTime(2023,4,29), amount: 2000),
    TransactionEntitie(type: TransactionType.add(Expense(category: ExpenseCategory.transportation)), date: DateTime(2023,4,29), amount: 2000),
  ];

  test("should get list of Transactions from local repository in specific day", ()async{

    when(mockTransactionRepository.getTransactionsInDay(any)).thenAnswer((_) async=>Right(transactions));

    final result = await usecase(Params(dateTime: DateTime(2023,15,5)));

    expect(result, Right(transactions));
    verify(mockTransactionRepository.getTransactionsInDay(DateTime(2023,15,5)));
    verifyNoMoreInteractions(mockTransactionRepository);
  });

}