import 'package:flutter/material.dart';
import 'package:tourist_app/core/presentation/style/colors.dart';
import 'package:tourist_app/core/presentation/style/text_styles.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Montserrat',
    useMaterial3: true,
    scaffoldBackgroundColor: backgroundColorLight,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: whiteColor),
    shadowColor: shadowColorLight,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: backgroundColorLight,
      color: backgroundColorLight,
      elevation: 3,
      shadowColor: shadowColorLight,
    ),
    colorScheme: const ColorScheme.light(
      primary: primaryColorLight,
      onPrimary: textColorLight,
      secondary: secondaryColorLight,
      tertiary: ratingActiveColorLight,
      background: backgroundColorLight,
      error: errorColorLight,
      outline: borderColorLight,
    ),
    textTheme: const TextTheme(
      titleMedium: appBarTextStyle,
      labelLarge: buttonTextStyle,
      labelMedium: labelTextStyle,
      labelSmall: snackbarTextStyle,
      bodyMedium: standardTextStyle,
      bodySmall: errorTextStyle,
      displayLarge: cardTitleTextStyle,
      displayMedium: cardSubtitleTextStyle,
      displaySmall: cardSmallTextStyle,
    ),
  );
}
