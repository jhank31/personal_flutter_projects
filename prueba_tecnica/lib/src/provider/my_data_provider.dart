import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDataProvider with ChangeNotifier {
  String _originCC = '';
  String _destinationCC = '';
  String _originAccount = '';
  String _destinationAccount = '';
  String _amountTransferred = '';

  String get originCC => _originCC;
  String get destinationCC => _destinationCC;
  String get originAccount => _originAccount;
  String get destinationAccount => _destinationAccount;
  String get amountTransferred => _amountTransferred;

  bool get todosLosCamposLlenos {
    return _originCC.isNotEmpty &&
        _destinationCC.isNotEmpty &&
        _originAccount.isNotEmpty &&
        _destinationAccount.isNotEmpty &&
        _amountTransferred.isNotEmpty;
  }

  set originCC(String newText) {
    _originCC = newText;
    notifyListeners();
  }

  set destinationCC(String newText) {
    _destinationCC = newText;
    notifyListeners();
  }

  set originAccount(String newText) {
    _originAccount = newText;
    notifyListeners();
  }

  set destinationAccount(String newText) {
    _destinationAccount = newText;
    notifyListeners();
  }

  set amountTransferred(String newText) {
    _amountTransferred = newText;
    notifyListeners();
  }

  String formatCurrency(int amount) {
    var formatter = NumberFormat.currency(
      locale: 'es_CO',
      symbol: 'COP',
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }

  
}
