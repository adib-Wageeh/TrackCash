import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_bar_state.dart';

class AppBarCubit extends Cubit<AppBarState> {

  AppBarCubit() : super(AppBarInitial());


  void setCalenderView(){
    emit(AppBarInitial());
  }

  void setAddView(){

    emit(AppBarAdd());
  }

  void setReportView(){

    emit(AppBarReport());
  }

  void setSettingsView(){

    emit(AppBarSettings());
  }
}
