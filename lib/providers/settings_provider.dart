import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  String currentLocale = "en";
  ThemeMode mode = ThemeMode.light;

  void setCurrentMode(ThemeMode newMode){
    mode = newMode;
    notifyListeners();
  }
  bool isDarkEnabled() => mode == ThemeMode.dark;
  void setCurrentLocale(String newLocale){
    currentLocale = newLocale;
    notifyListeners();
  }
}