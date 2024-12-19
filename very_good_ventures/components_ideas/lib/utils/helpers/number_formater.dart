import 'package:intl/intl.dart';

abstract class NumberFormater {
  String formatNumber(double number) {
    return number.toString();
  }
}

final class FormaterColombianCoin extends NumberFormater {
  @override
  String formatNumber(double number) {
    final priceFormated = NumberFormat('#,##0.00', 'es_CO').format(number);
    return r'$' + priceFormated;
  }
}
