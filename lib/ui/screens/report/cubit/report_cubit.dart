import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_cash/core/data/model/transaction.dart';
import 'package:track_cash/core/data/model/transaction_type_total.dart';
import 'package:track_cash/core/injection_container.dart';
import 'package:track_cash/ui/screens/report/cubit/report_state.dart';
import 'package:track_cash/ui/screens/report/repository/report_repository.dart';

class ReportCubit extends Cubit<ReportState> {
  static ReportCubit get(BuildContext context) => BlocProvider.of(context);

  late final ReportRepository _reportRepository;
  List<TransactionTypeTotal>? _transactionTypesTotal;
  double? _total;

  ReportCubit({
    ReportRepository? reportRepository,
  }) : super(const ReportState.initial()) {
    _reportRepository = reportRepository ?? getIt.get<ReportRepository>();
  }

  Future<void> getTransactionsInMonth({required DateTime date,required int type}) async {
    emit(ReportState.loading());

    final result = await _reportRepository.getTransactionsInMonth(date);

    result.fold((error) {
      emit(ReportState.error(error));
    }, (data) {
      _transactionTypesTotal = convertToTransactionTypesTotal(data,type);
      emit(ReportState.success());
    });
  }

  List<TransactionTypeTotal> convertToTransactionTypesTotal(
      List<TransactionEntity> transactionEntities,int type) {
    List<TransactionTypeTotal> totals = [];
    double totalAmount = 0;
    bool found = false;
    for (TransactionEntity transactionEntity in transactionEntities) {
      found = false;
      for (TransactionTypeTotal total in totals) {
        print('${transactionEntity.type} ${type}');
        if (total.transactionEntity.type.id == transactionEntity.id &&
            transactionEntity.type.type == type) {
          totals[totals.indexOf(total)].copyWith(
            amount: totals[totals.indexOf(total)].amount + transactionEntity.amount,
          );
          totalAmount += transactionEntity.amount;
          found = true;
        }
      }
      if(!found && transactionEntity.type.type == type) {
        totalAmount += transactionEntity.amount;
        totals.add(
          TransactionTypeTotal(
            transactionEntity: transactionEntity,
            amount: transactionEntity.amount,
          )
        );
      }
    }
    _total = totalAmount;
    return totals;
  }

  List<TransactionTypeTotal>? get transactionTypesTotal =>
      _transactionTypesTotal;

  double? get total => _total;
}
