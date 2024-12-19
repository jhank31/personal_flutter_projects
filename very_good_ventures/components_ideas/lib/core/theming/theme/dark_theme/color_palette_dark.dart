import 'package:components_ideas/core/theming/core/base_color_palette.dart';
import 'package:flutter/material.dart';

final class ColorPaletteDark extends BaseColorPalette {
  /// Paleta de colores de la aplicación cuando es dark
  @override
  Color get primary100 => Colors.deepPurple.shade100;

  @override
  Color get primary200 => Colors.deepPurple.shade200;

  @override
  Color get primary300 => Colors.deepPurple.shade300;

  @override
  Color get primary400 => Colors.deepPurple.shade400;

  @override
  Color get primary500 => Colors.deepPurple.shade500;

  @override
  Color get secondary100 => Colors.green.shade100;

  @override
  Color get secondary200 => Colors.green.shade200;

  @override
  Color get secondary300 => Colors.green.shade300;

  @override
  Color get secondary400 => Colors.green.shade400;

  @override
  Color get secondary500 => Colors.green.shade500;

  @override
  Color get primaryColor => primary500;
  @override
  Color get secondaryColor => secondary500;
  @override
  ColorScheme get colorScheme => ColorScheme.fromSeed(
        seedColor: secondary500,
      );
}
