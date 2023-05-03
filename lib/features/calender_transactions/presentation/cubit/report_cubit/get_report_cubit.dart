import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_report_state.dart';

class GetReportCubit extends Cubit<GetReportState> {
  GetReportCubit() : super(GetReportInitial());
}
