import 'package:track_cash/core/error/Failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_state.freezed.dart';

@freezed
class ReportState with _$ReportState {
  const factory ReportState.initial() = _Initial;

  const factory ReportState.success() = Success;

  const factory ReportState.loading() = Loading;

  const factory ReportState.error([Failure? failure]) = ErrorDetails;
}

extension ReportStateExtention on ReportState {
  bool get isInitial => this is _Initial;

  bool get isLoading => this is Loading;

  bool get isSuccess => this is Success;

  bool get isError => this is ErrorDetails;

}
