import 'package:shared_preferences/shared_preferences.dart';

class ThemeUseCase{

  Future<bool> setThemeType(bool type)async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if(type==true){
      prefs.setInt("themeType",1);
      return true;
    }else{
      prefs.setInt("themeType",2);
      return false;
    }
  }

  Future<bool> getThemeType()async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.getInt("themeType")==null){
      prefs.setInt("themeType",1);
    }

    if(prefs.getInt("themeType")==1){
      return true;
    }else{
      return false;
    }

  }

}