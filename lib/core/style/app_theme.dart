import 'package:flutter/material.dart';
import 'package:tourist_app/core/style/colors.dart';

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
      shadowColor: Colors.black45,
    ),
    extensions: const [
      AppColors(
        backgroundColor: backgroundColorLight,
        textColor: textColorLight,
        primaryColor: primaryColorLight,
        secondaryColor: secondaryColorLight,
        errorColor: errorColorLight,
        borderColor: borderColorLight,
        ratingActiveColor: ratingActiveColorLight,
        ratingInactiveColor: ratingInactiveColorLight,
      ),
    ],
  );
}
