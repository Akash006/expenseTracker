import 'dart:ui';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  //toggle the theme
  void toggleTheme() {
    final currentTheme = themeMode;
    print(currentTheme);
    if (currentTheme == ThemeMode.light){
      themeMode = ThemeMode.dark;
    }else{
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}