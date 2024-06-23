import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:track_cash/core/global/theme/app_themes.dart';
import '../../../domain/use_case/theme_use_case.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({required this.themeUseCase}) : super(ThemeInitial());
  ThemeUseCase themeUseCase;

  bool toggleVal = true;
  void getTheme()async{

    toggleVal = await themeUseCase.getThemeType();
    if(toggleVal == true){
      emit(setTheme(themeData: appThemeData[AppThemes.Light]!));
    }else{
      emit(setTheme(themeData: appThemeData[AppThemes.Dark]!));
    }
  }

  void saveTheme(bool type)async{

    await themeUseCase.setThemeType(type);
    getTheme();
  }

}
