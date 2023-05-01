import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    if (newLanguage == appLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }

  bool isEnglish() {
    if (appLanguage == 'en') {
      return true;
    }
    return false;
  }

  ///-------------------------------------------------------------------------------------
  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }

  bool isDark() {
    if (appTheme == ThemeMode.dark) {
      return true;
    }
    return false;
  }
}
