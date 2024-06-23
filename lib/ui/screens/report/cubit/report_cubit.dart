import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:track_cash/core/data/model/transaction_type_total.dart';
import 'package:track_cash/ui/screens/report/cubit/report_state.dart';
import 'package:track_cash/ui/screens/report/repository/report_repository.dart';

class ReportCubit extends Cubit<ReportState> {
  static ReportCubit get(BuildContext context) =>
      BlocProvider.of(context);

  late final ReportRepository _reportRepository;
  List<TransactionTypeTotal>? _transactionTypesTotal;
  double? _total;

  ReportCubit({
    ReportRepository? reportRepository,
  }) : super(const ReportState.initial()) {
    _reportRepository =
        reportRepository ?? GetIt.I.get<ReportRepository>();
  }

  List<TransactionTypeTotal>? get transactionTypesTotal => _transactionTypesTotal;
  double? get total => _total;

}