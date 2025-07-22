import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  ThemeController(this.sharedPreferences) {
    _loadTheme();
  }

  final SharedPreferences sharedPreferences;

  late bool _isDarkTheme;

  bool get isDarkTheme => _isDarkTheme;

  void switchTheme() async {
    _isDarkTheme = !_isDarkTheme;
    await sharedPreferences.setBool("isDarkTheme", _isDarkTheme);
    notifyListeners();
  }

  void _loadTheme() {
    _isDarkTheme = sharedPreferences.getBool("isDarkTheme") ?? false;
    notifyListeners();
  }
}
