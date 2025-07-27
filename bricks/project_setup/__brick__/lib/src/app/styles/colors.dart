import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF1E78EB);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFFFE753F);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color tertiary = Color(0xFF0A4A85);
  static const Color onTertiary = Color(0xFF0D002C);
  static const Color error = Color(0xFFEB1E33);
  static const Color onError = Color(0xFFFFCB03);
  static const Color outline = Color(0xFF00B12C);

  // light
  static const Color lightShadow = Color(0xFF999999);
  static const Color lightScrim = Color(0xFF999999);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceContainer = Color(0xFFF8F9FB);
  static const Color lightOnSurface = Color(0xFF878C8E);
  static const Color lightOnSurfaceVariant = Color(0xFF52525B);

  // dark
  static const Color darkShadow = Color(0x40404040);
  static const Color darkOutline = Color(0xFF999999);
  static const Color darkSurface = Color(0xFF222222);
  static const Color darkSurfaceContainer = Color(0xFF181818);
  static const Color darkOnSurface = Color(0xFFC5CDD2);
  static const Color darkOnSecondary = Color(0xFFE0E0E0);

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: primary,
    onPrimary: onPrimary,
    secondary: secondary,
    onSecondary: onSecondary,
    surface: lightSurface,
    surfaceContainer: lightSurfaceContainer,
    onSurface: lightOnSurface,
    onSurfaceVariant: lightOnSurfaceVariant,
    tertiary: tertiary,
    onTertiary: onTertiary,
    scrim: lightScrim,
    shadow: lightShadow,
    outline: outline,
    error: error,
    onError: onError,
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: primary,
    secondary: secondary,
    surface: darkSurface,
    tertiary: tertiary,
    onTertiary: onTertiary,
    shadow: darkShadow,
    outline: darkOutline,
    surfaceContainer: darkSurfaceContainer,
    error: error,
    onPrimary: onPrimary,
    onSecondary: darkOnSecondary,
    onSurface: darkOnSurface,
    onError: onError,
    brightness: Brightness.dark,
  );

  static ColorScheme getColorScheme(ThemeMode themeMode) {
    return themeMode == ThemeMode.dark ? darkColorScheme : lightColorScheme;
  }
}
