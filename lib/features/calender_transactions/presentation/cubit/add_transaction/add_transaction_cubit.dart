import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:track_cash/core/enums/enums.dart';
import 'package:track_cash/features/calender_transactions/domain/entities/transaction.dart';
import 'package:track_cash/features/calender_transactions/presentation/cubit/change_category/change_category_cubit.dart';
import '../../../../../core/assets/assets.dart';
import '../../../domain/usecases/add_transaction.dart';
part 'add_transaction_state.dart';

class AddTransactionCubit extends Cubit<AddTransactionState> {
  AddTransactionCubit({required this.addTransaction}) : super(AddTransactionInitial());

  AddTransaction addTransaction;

  late bool isIncomeTransaction;
  String? amount;
  DateTime selectedDate = DateTime.now();


  void addTransactionMethod(BuildContext context)async{

    int categoryIndex = BlocProvider.of<ChangeCategoryCubit>(context).categoryIndex;
    TransactionType transactionType = TransactionType(type: (isIncomeTransaction)?1:2, category: (isIncomeTransaction)?IncomeCategory.values[categoryIndex].name:ExpenseCategory.values[categoryIndex].name);
    final result = await addTransaction.call(Params(amount: double.parse(amount!),dateTime: selectedDate,transactionType: transactionType));
    result.fold((error){
      emit(AddTransactionError(error: error.error));
    },(transactions){
      emit(AddTransactionDone());
    });
  }

  void switchTransactionType(bool isIncome){

    isIncomeTransaction = isIncome;
    if(isIncomeTransaction == true){
      emit(AddTransactionIncome(list: IncomeCategory.values,images: Assets.incomeImages));
    }else{
      emit(AddTransactionExpense(list: ExpenseCategory.values,images: Assets.expenseImages));
    }
  }

  void setDateTime(dt){
    selectedDate = dt;
    switchTransactionType(isIncomeTransaction);
  }

  void setAmount(money){
    amount = money;
  }

  String getAmount(){
    if(amount == null){
      return "";
    }
    return amount.toString();

  }

  void clearAddPage(BuildContext context){
    BlocProvider.of<ChangeCategoryCubit>(context).onCategoryChange(newCategoryIndex: 0);
    amount = "";
    selectedDate = DateTime.now();
  }


}
