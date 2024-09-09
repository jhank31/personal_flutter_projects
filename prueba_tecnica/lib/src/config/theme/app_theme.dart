import 'package:flutter/material.dart';

class AppTheme {
  final bool themeMode;

  AppTheme({required this.themeMode});

  ThemeData getTheme() {
    const seedColor = Color.fromARGB(255, 7, 80, 59);
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      brightness: themeMode == true ? Brightness.dark : Brightness.light,
    );
  }
}
