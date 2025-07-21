import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFF3344);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFFFFB800);
  static const Color tertiary = Color(0xFFFB4C55);
  static const Color onTertiary = Color(0xFF67112A);
  static const Color error = Color(0xFFB00020);
  static const Color onError = Color(0xFFFFFFFF);

  // light
  static const Color lightShadow = Color(0xFFE5E5E5);
  static const Color lightOutline = Color(0xFF999999);
  static const Color lightSurface = Color(0xFFF7F6F6);
  static const Color lightSurfaceContainer = Color(0xFFFFFFFF);
  static const Color lightOnSurface = Color(0xFF52525B);
  static const Color lightOnSecondary = Color(0xFF2B0810);

  // dark
  static const Color darkShadow = Color(0x40404040);
  static const Color darkOutline = Color(0xFF999999);
  static const Color darkSurface = Color(0xFF222222);
  static const Color darkSurfaceContainer = Color(0xFF181818);
  static const Color darkOnSurface = Color(0xFFC5CDD2);
  static const Color darkOnSecondary = Color(0xFFE0E0E0);

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: primary,
    secondary: secondary,
    surface: lightSurface,
    tertiary: tertiary,
    onTertiary: onTertiary,
    outline: lightOutline,
    shadow: lightShadow,
    surfaceContainer: lightSurfaceContainer,
    error: error,
    onPrimary: onPrimary,
    onSecondary: lightOnSecondary,
    onSurface: lightOnSurface,
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
