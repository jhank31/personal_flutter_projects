import 'package:flutter/material.dart';

class AppTypography {
  const AppTypography();

  String get primaryFontFamily => 'Roboto';

  //* xs = extra small
  TextStyle get xsRegular => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      );

  TextStyle get xsMedium => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      );

  TextStyle get xsBold => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
      );

  //* sm = small
  TextStyle get smRegular => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      );

  TextStyle get smMedium => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      );

  TextStyle get smiBold => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
      );

  //* md = medium
  TextStyle get mdRegular => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      );

  TextStyle get mdMedium => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      );

  TextStyle get mdBold => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
      );

  //* lg = large
  TextStyle get lgRegular => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      );

  TextStyle get lgMedium => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      );

  TextStyle get lgSemiBold => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
      );

  //* xl = extra large
  TextStyle get xlRegular => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      );

  TextStyle get xlMedium => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      );

  TextStyle get xlBold => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
      );

  //* xxl = extra extra large
  TextStyle get xxlRegular => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      );

  TextStyle get xxlMedium => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      );

  TextStyle get xxlBold => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
      );

  //* xxxl = extra extra extra large
  TextStyle get xxxlRegular => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      );

  TextStyle get xxxlMedium => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      );

  TextStyle get xxxlBold => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
      );
}
