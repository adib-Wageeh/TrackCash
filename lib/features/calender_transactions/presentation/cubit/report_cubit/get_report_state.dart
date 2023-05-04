part of 'get_report_cubit.dart';

@immutable
abstract class GetReportState {}

class GetReportInitial extends GetReportState {}

class GetReportLoading extends GetReportState {}


class GetExpenseReportInMonthLoaded extends GetReportState {
  final List<TransactionTypeTotal> transactions;
  final DateTime selectedDate;
  final bool isSelected;
  final String selectedText;
  final double total;
  GetExpenseReportInMonthLoaded({
  required this.total
  ,required this.selectedText,required this.transactions,required this.selectedDate,required this.isSelected});
}

class GetIncomeReportInMonthLoaded extends GetReportState {
  final List<TransactionTypeTotal> transactions;
  final DateTime selectedDate;
  final bool isSelected;
  final String selectedText;
  final double total;
  GetIncomeReportInMonthLoaded({required this.total,required this.selectedText,required this.transactions,required this.selectedDate,required this.isSelected});
}

class GetReportEmpty extends GetReportState {
  final bool isSelected;
  final DateTime selectedDate;
  final String selectedText;
  GetReportEmpty({required this.selectedText,required this.isSelected,required this.selectedDate});
}