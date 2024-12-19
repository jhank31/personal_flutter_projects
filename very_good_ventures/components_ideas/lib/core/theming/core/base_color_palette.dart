import 'package:flutter/material.dart';

abstract class BaseColorPalette {
  /// Colores Primarios de la aplicacion
  Color get primary100;
  Color get primary200;
  Color get primary300;
  Color get primary400;
  Color get primary500;

  /// Colores secundarios de la aplicacion
  Color get secondary100;
  Color get secondary200;
  Color get secondary300;
  Color get secondary400;
  Color get secondary500;

  /// Status color palette
  /// Success
  Color get success100 => const Color(0xFFE6F9E6);
  Color get success200 => const Color(0xFFB3E6B3);
  Color get success300 => const Color(0xFF80D580);
  Color get success400 => const Color(0xFF4DB84D);
  Color get success500 => const Color(0xFF009900);

  /// Warning
  Color get warning100 => const Color(0xFFFFE6CC);
  Color get warning200 => const Color(0xFFFFD699);
  Color get warning300 => const Color(0xFFFFB84D);
  Color get warning400 => const Color(0xFFFF9900);
  Color get warning500 => const Color(0xFFCC7A00);

  /// Error
  Color get error100 => const Color(0xFFFFCCCB);
  Color get error200 => const Color(0xFFFF9999);
  Color get error300 => const Color(0xFFFF4D4D);
  Color get error400 => const Color(0xFFFF0000);
  Color get error500 => const Color(0xFFCC0000);

  /// Info
  Color get info100 => const Color(0xFFCCEBFF);
  Color get info200 => const Color(0xFF99D1E9);
  Color get info300 => const Color(0xFF66B2D5);
  Color get info400 => const Color(0xFF3399CC);
  Color get info500 => const Color(0xFF007ACC);

  /// Grayscale
  Color get gray50 => const Color(0xFFF9F9F9);
  Color get gray100 => const Color(0xFFF0F0F0);
  Color get gray200 => const Color(0xFFE6E6E6);
  Color get gray300 => const Color(0xFFD9D9D9);
  Color get gray400 => const Color(0xFFBFBFBF);
  Color get gray500 => const Color(0xFF999999);
  Color get gray600 => const Color(0xFF666666);
  Color get gray700 => const Color(0xFF333333);
  Color get gray800 => const Color(0xFF1A1A1A);
  Color get gray900 => const Color(0xFF000000);

  /// The primary color: ideally taken from a single primary color
  Color get primaryColor;

  /// The secondary color: ideally taken from a single secondary color
  Color get secondaryColor;

  /// The background color: ideally taken from a single background color
  ColorScheme get colorScheme;

  /// Pure colors
  /// White
  Color get white => const Color(0xFFFFFFFF);

  /// Black
  Color get black => const Color(0xFF000000);
}
