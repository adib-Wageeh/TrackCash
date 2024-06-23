import 'package:track_cash/core/error/Failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_transaction_state.freezed.dart';

@freezed
class AddTransactionState with _$AddTransactionState {
  const factory AddTransactionState.initial() = _Initial;

  const factory AddTransactionState.success() = Success;

  const factory AddTransactionState.loading() = Loading;

  const factory AddTransactionState.error([Failure? failure]) = ErrorDetails;
}

extension AddTransactionStateExtention on AddTransactionState {
  bool get isInitial => this is _Initial;

  bool get isLoading => this is Loading;

  bool get isSuccess => this is Success;

  bool get isError => this is ErrorDetails;

}
