import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:track_cash/ui/screens/add_transaction/cubit/add_transaction_state.dart';
import 'package:track_cash/ui/screens/add_transaction/repository/add_transaction_repository.dart';

class AddTransactionCubit extends Cubit<AddTransactionState> {
  static AddTransactionCubit get(BuildContext context) =>
      BlocProvider.of(context);

  late final AddTransactionRepository _addTransactionRepository;

  AddTransactionCubit({
    AddTransactionRepository? addTransactionRepository,
  }) : super(const AddTransactionState.initial()) {
    _addTransactionRepository =
        addTransactionRepository ?? GetIt.I.get<AddTransactionRepository>();
  }

}