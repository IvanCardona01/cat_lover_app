import 'package:flutter/material.dart';

class AppTheme {
  static const Color _primaryLight = Color(0xFFFF8A65);
  static const Color _secondaryLight = Color(0xFF9C6B98);
  static const Color _tertiaryLight = Color(0xFFFFB74D);
  static const Color _backgroundLight = Color(0xFFFFF8F0);
  static const Color _textLight = Color(0xFF3E2723);

  static const Color _primaryDark = Color(0xFFFFAB91);
  static const Color _secondaryDark = Color(0xFFB39DDB);
  static const Color _tertiaryDark = Color(0xFFFFD54F);
  static const Color _backgroundDark = Color(0xFF1F1B16);
  static const Color _textDark = Color(0xFFECE0D7);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: ColorScheme.light(
      primary: _primaryLight,
      secondary: _secondaryLight,
      tertiary: _tertiaryLight,
      surface: _backgroundLight,
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: _textLight,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: _textLight,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: _textLight,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: _textLight,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: _textLight,
      ),
    ),

    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: _backgroundLight,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: ColorScheme.dark(
      primary: _primaryDark,
      secondary: _secondaryDark,
      tertiary: _tertiaryDark,
      surface: _backgroundDark,
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: _textDark,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: _textDark,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: _textDark,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: _textDark,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: _textDark,
      ),
    ),

    cardTheme: CardThemeData(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: _backgroundDark,
    ),
  );
}
