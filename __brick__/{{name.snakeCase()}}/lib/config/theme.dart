import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/config/colors.dart';

class AppTheme {
  const AppTheme._(); // this basically makes it so you can't instantiate this class

  static String get _fontFamily => 'Roboto';

  static ColorScheme get _lightScheme {
    return ColorScheme.fromSeed(
      seedColor: AppColors.primaryLight,
      brightness: Brightness.light,
    );
  }

  static ColorScheme get _darkScheme {
    return ColorScheme.fromSeed(
      seedColor: AppColors.primaryDark,
      brightness: Brightness.dark,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: _lightScheme,
      fontFamily: _fontFamily,
      useMaterial3: true,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: _darkScheme,
      fontFamily: _fontFamily,
      useMaterial3: true,
    );
  }
}
