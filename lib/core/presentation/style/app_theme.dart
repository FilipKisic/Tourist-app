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
      tertiaryContainer: ratingInactiveColorLight,
      background: backgroundColorLight,
      error: errorColorLight,
      outline: borderColorLight,
    ),
  );
}

extension CustomTextTheme on TextTheme {
  TextStyle get title => titleTextStyle;
  TextStyle get appBarTitle => appBarTextStyle;
  TextStyle get buttonText => buttonTextStyle;
  TextStyle get label => labelTextStyle;
  TextStyle get snackbar => snackbarTextStyle;
  TextStyle get standard => standardTextStyle;
  TextStyle get error => errorTextStyle;
  TextStyle get description => descriptionTextStyle;
  TextStyle get cardTitle => cardTitleTextStyle;
  TextStyle get cardSubtitle => cardSubtitleTextStyle;
  TextStyle get cardSmall => cardSmallTextStyle;
}
