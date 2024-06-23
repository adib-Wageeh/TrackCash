import 'package:track_cash/core/error/Failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_state.freezed.dart';

@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState.initial() = _Initial;

  const factory CalendarState.success() = Success;

  const factory CalendarState.loading() = Loading;

  const factory CalendarState.error([Failure? failure]) = ErrorDetails;
}

extension CalendarStateExtention on CalendarState {
  bool get isInitial => this is _Initial;

  bool get isLoading => this is Loading;

  bool get isSuccess => this is Success;

  bool get isError => this is ErrorDetails;

}
