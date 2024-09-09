import 'package:shared_preferences/shared_preferences.dart';

class Preferencias {
  static final Preferencias _instancia = Preferencias._internal();
  factory Preferencias() {
    return _instancia;
  }

  Preferencias._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool get isDarkTheme {
    return _prefs.getBool('isDarkTheme') ?? false;
  }

  set isDarkTheme(bool value) {
    _prefs.setBool('isDarkTheme', value);
  }
}
