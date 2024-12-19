import 'package:components_ideas/core/theming/core/base_color_palette.dart';
import 'package:flutter/material.dart';

final class ColorPaletteLight extends BaseColorPalette {
  @override
  Color get primary100 => Colors.teal.shade100;

  @override
  Color get primary200 => Colors.teal.shade200;

  @override
  Color get primary300 => Colors.teal.shade300;

  @override
  Color get primary400 => Colors.teal.shade400;

  @override
  Color get primary500 => Colors.teal.shade500;

  @override
  Color get secondary100 => Colors.orange.shade100;

  @override
  Color get secondary200 => Colors.orange.shade200;

  @override
  Color get secondary300 => Colors.orange.shade300;

  @override
  Color get secondary400 => Colors.orange.shade400;

  @override
  Color get secondary500 => Colors.orange.shade500;

  @override
  Color get primaryColor => primary500;
  @override
  Color get secondaryColor => secondary500;
  @override
  ColorScheme get colorScheme => ColorScheme.fromSeed(
        seedColor: primary500,
      );
}
