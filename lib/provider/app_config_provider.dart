import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = '';
  ThemeMode? appTheme = null;

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

  Future<void> setPrefIsEnglish(bool flag) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isEnglish', flag);
    print("SetPrefIsEnglish done");
  }

  Future<void> setPrefIsDark(bool flag) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', flag);
    print("SetPrefIsDark done");
  }
}
