import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/config/preferences/preferences.dart';


class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  final prefs = Preferencias();

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();

    prefs.isDarkTheme = mode == ThemeMode.dark;
  }
}
