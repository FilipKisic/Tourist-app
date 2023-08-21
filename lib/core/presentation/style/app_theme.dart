import 'package:flutter/material.dart';
import 'package:tourist_app/core/presentation/style/colors.dart';
import 'package:tourist_app/core/presentation/style/text_styles.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Montserrat',
    useMaterial3: true,
    scaffoldBackgroundColor: backgroundColorLight,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.white),
    shadowColor: shadowColorLight,
    appBarTheme: const AppBarTheme(color: Colors.white),
    colorScheme: const ColorScheme.light(
      primary: primaryColorLight,
      onPrimary: textColorLight,
      secondary: secondaryColorLight,
      background: backgroundColorLight,
      error: errorColorLight,
      outline: borderColorLight,
    ),
    textTheme: const TextTheme(
      titleMedium: appBarTextStyle,
      labelLarge: buttonTextStyle,
      labelMedium: labelTextStyle,
      bodyMedium: standardTextStyle,
      bodySmall: errorTextStyle,
    ),
  );
}
