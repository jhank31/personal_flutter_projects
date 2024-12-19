import 'package:components_ideas/core/theming/core/base_color_palette.dart';
import 'package:components_ideas/core/theming/core/base_theme.dart';
import 'package:components_ideas/core/theming/theme/light_theme/color_palette_light.dart';
import 'package:flutter/material.dart';

class LightTheme  extends AppTheme {
  const LightTheme();

  @override
  List<Color> get appBarGradientColors => [
        baseColorPalette.primary400,
        baseColorPalette.secondaryColor ,
  ];

  @override
  BaseColorPalette get baseColorPalette => ColorPaletteLight();

  @override
  bool get isDark => false;

  @override
  ThemeData get theme => baseTheme;
}
