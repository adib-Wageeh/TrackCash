import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/global/theme/app_themes.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());


  bool toggleVal = true;
  void toggleTheme(bool themeState){

    toggleVal = themeState;
    if(themeState == true){
      emit(setTheme(themeData: appThemeData[AppThemes.Light]!));
    }else{
      emit(setTheme(themeData: appThemeData[AppThemes.Dark]!));
    }
  }

}
