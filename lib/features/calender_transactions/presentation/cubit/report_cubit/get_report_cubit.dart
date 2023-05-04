import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:track_cash/features/calender_transactions/domain/usecases/get_transactions_in_month.dart';
import '../../../domain/entities/transaction_type_total.dart';
import '../../../domain/usecases/get_transactions_total_amount.dart';

part 'get_report_state.dart';

class GetReportCubit extends Cubit<GetReportState> {
  GetReportCubit({required this.getTransactionInMonth,required this.getTransactionTotalAmount}) : super(GetReportInitial());
  GetTransactionInMonth getTransactionInMonth;
  GetTransactionTotalAmount getTransactionTotalAmount;

  DateTime selectedTime = DateTime.now();
  bool isIncome = true;
  String selectedText = "INCOME";

  void editMonth(bool type){

    if(type){
      if(isIncome) {
        getIncomeTransactionsPerMonth(
            DateTime(selectedTime.year, selectedTime.month + 1));
      }else{
        getExpenseTransactionsPerMonth(
            DateTime(selectedTime.year, selectedTime.month + 1));
      }
    }else{
      if(isIncome) {
        getIncomeTransactionsPerMonth(
            DateTime(selectedTime.year, selectedTime.month - 1));
      }else{
        getExpenseTransactionsPerMonth(
            DateTime(selectedTime.year, selectedTime.month - 1));
      }    }
  }

  void getExpenseTransactionsPerMonth(DateTime time)async{

    emit(GetReportLoading());
    selectedTime = time;
   final result = await getTransactionInMonth.call(Params(dateTime: selectedTime));

   result.fold((l) => print(l), (r) {

       List<TransactionTypeTotal> data=[];
       for(int x=0;x<r.length;x++){
         if(r[x].type.type==2){
           data.add(r[x]);
         }
       }
       if(data.isEmpty){
         emit(GetReportEmpty(isSelected: false,selectedDate: selectedTime,selectedText: "EXPENSE"));
       }else {
         emit(GetExpenseReportInMonthLoaded(transactions: data,isSelected: false
             ,selectedDate: selectedTime,selectedText: "EXPENSE",
         total: getTransactionTotalAmount.getAmount(data)
         ));
       }
   });

  }

  void getIncomeTransactionsPerMonth(DateTime time)async{

    emit(GetReportLoading());
    selectedTime = time;
    final result = await getTransactionInMonth.call(Params(dateTime: selectedTime));

    result.fold((l) => print(l), (r) {

        List<TransactionTypeTotal> data=[];
        for(int x=0;x<r.length;x++){
          if(r[x].type.type==1){
            data.add(r[x]);
          }
        }
        if(data.isEmpty){
          emit(GetReportEmpty(isSelected: true,selectedDate: selectedTime,selectedText: "INCOME"));
        }else {
          emit(GetIncomeReportInMonthLoaded(
          total: getTransactionTotalAmount.getAmount(data)
          ,transactions: data,isSelected: true,selectedDate: selectedTime,selectedText: "INCOME"));
        }
    });

  }


  void switchTransactionState(bool isIncomeState) {
      isIncome = isIncomeState;
      if (isIncome) {
        getIncomeTransactionsPerMonth(selectedTime);
      } else {
        getExpenseTransactionsPerMonth(selectedTime);
      }

  }

}