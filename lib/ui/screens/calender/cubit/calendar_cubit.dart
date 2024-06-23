import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_cash/core/data/model/transaction.dart';
import 'package:track_cash/core/injection_container.dart';
import 'package:track_cash/ui/screens/calender/cubit/calendar_state.dart';
import 'package:track_cash/ui/screens/calender/repository/calendar_repository.dart';

class CalendarCubit extends Cubit<CalendarState> {
  static CalendarCubit get(BuildContext context) =>
      BlocProvider.of(context);

  late final CalendarRepository _calenderRepository;
  List<TransactionEntity>? _transactions;

  CalendarCubit({
    CalendarRepository? calenderRepository,
  }) : super(const CalendarState.initial()) {
    _calenderRepository =
        calenderRepository ?? getIt.get<CalendarRepository>();
  }

  Future<void> getTransactions(DateTime date) async {
    emit(CalendarState.loading());

    final result = await _calenderRepository.getTransactionsInDay(date);

    result.fold((error){
      print(error);
      emit(CalendarState.error(error));
    }, (transactions){
      _transactions = transactions;
      emit(CalendarState.success());
    });

  }

  List<TransactionEntity>? get transactions => _transactions;

}