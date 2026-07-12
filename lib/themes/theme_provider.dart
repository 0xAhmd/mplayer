// this will be the theme controller
import 'package:flutter/material.dart';
import 'package:mplayer/themes/dark_mode.dart';
import 'package:mplayer/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier{
  // initially the theme is light mode
  ThemeData _themeData = lightMode; 
  // get the current theme mode
  ThemeData get themeData => _themeData;
  // check if the current theme mode is dark mode
  bool get isDarkMode => _themeData == darkMode;
  // set theme
  void setTheme(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
  // toggle theme
  void toggleTheme(){
    if(_themeData == lightMode){
      _themeData = darkMode;
    }else{
      _themeData = lightMode;
    }
    notifyListeners();
  }
}