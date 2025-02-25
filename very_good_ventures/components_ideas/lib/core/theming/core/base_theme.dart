import 'package:components_ideas/core/theming/core/app_typography.dart';
import 'package:components_ideas/core/theming/core/base_color_palette.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppTheme extends Equatable {
  const AppTheme();

  /// Color palette from where the theme will be get the colora
  BaseColorPalette get baseColorPalette;

  /// The color Scheme of the theme
  ColorScheme get colorScheme => baseColorPalette.colorScheme;

  /// The typography of the theme
  AppTypography get typography => const AppTypography();

  /// Colors list of the gradient
  List<Color> get appBarGradientColors;

  /// The primary color of the button
  Color get primaryButtonColor => baseColorPalette.primaryColor;

  /// Wheter the theme is dark or not
  bool get isDark;

  Brightness get brightness => isDark ? Brightness.dark : Brightness.light;

  Brightness get brightnessStatusBar => Brightness.light;

  SystemUiOverlayStyle get systemUiOverlayStyle => SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // solo para android
        statusBarIconBrightness: brightnessStatusBar, // solo para android
        // solo para ios
        statusBarBrightness: brightnessStatusBar == Brightness.light
            ? Brightness.dark
            : Brightness.light,
      );

  ThemeData get theme;

  ThemeData get baseTheme => ThemeData(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 16),
            ),
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return baseColorPalette.primary100;
              }
              return baseColorPalette.primaryColor;
            }),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            side: WidgetStateProperty.resolveWith<BorderSide>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return BorderSide(
                    color: baseColorPalette.primary500,
                  );
                } else {
                  if (states.contains(WidgetState.disabled)) {
                    return BorderSide(
                      color: baseColorPalette.gray100,
                    );
                  }
                }
                return BorderSide(
                  color: baseColorPalette.primary500,
                );
              },
            ),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: baseColorPalette.primaryColor,
          foregroundColor: baseColorPalette.white,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: baseColorPalette.secondaryColor,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: baseColorPalette.primaryColor,
          secondary: baseColorPalette.secondaryColor,
          brightness: brightness,
        ),
        appBarTheme: AppBarTheme(
          foregroundColor: baseColorPalette.white,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: baseColorPalette.white,
          ),
          backgroundColor: baseColorPalette.primaryColor,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: baseColorPalette.white,
        ),
        dialogTheme: DialogTheme(
          surfaceTintColor: baseColorPalette.white,
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: baseColorPalette.white,
        ),
        listTileTheme: ListTileThemeData(
          iconColor: baseColorPalette.white,
          textColor: baseColorPalette.white,
          tileColor: baseColorPalette.primaryColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: baseColorPalette.primaryColor,
          selectedItemColor: baseColorPalette.white,
          unselectedItemColor: baseColorPalette.white.withValues(alpha: 0.5),
        ),
        useMaterial3: true,
        fontFamily: typography.primaryFontFamily,
        brightness: brightness,
        primaryColor: baseColorPalette.primaryColor,
        dropdownMenuTheme: DropdownMenuThemeData(
          menuStyle: MenuStyle(
            backgroundColor: WidgetStatePropertyAll(
              baseColorPalette.white,
            ),
            surfaceTintColor: WidgetStatePropertyAll(
              baseColorPalette.white,
            ),
          ),
        ),
      );

  @override
  List<Object?> get props => [theme, isDark, baseColorPalette];
}
