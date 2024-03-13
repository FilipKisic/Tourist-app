import 'package:flutter/material.dart';

//Light palette
const backgroundColorLight = Color(0xFFFAFDFF);
const textColorLight = Color(0xFF171C26);
const whiteColor = Color(0xFFFFFFFF);
const primaryColorLight = Color(0xFFD17438);
const secondaryColorLight = Color(0xFF9D2C56);
const shadowColorLight = Color(0x26000000);
const errorColorLight = Color(0xFFFF2D2D);
const borderColorLight = Color.fromRGBO(0, 0, 0, 0.15);
const ratingActiveColorLight = Color.fromRGBO(255, 193, 7, 1);
const ratingInactiveColorLight = Color.fromRGBO(160, 160, 160, 1);

class AppColors extends ThemeExtension<AppColors> {
  final Color? backgroundColor;
  final Color? textColor;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? errorColor;
  final Color? borderColor;
  final Color? ratingActiveColor;
  final Color? ratingInactiveColor;

  const AppColors({
    required this.backgroundColor,
    required this.textColor,
    required this.primaryColor,
    required this.secondaryColor,
    required this.errorColor,
    required this.borderColor,
    required this.ratingActiveColor,
    required this.ratingInactiveColor,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    final Color? backgroundColor,
    final Color? textColor,
    final Color? primaryColor,
    final Color? secondaryColor,
    final Color? errorColor,
    final Color? borderColor,
    final Color? ratingActiveColor,
    final Color? ratingInactiveColor,
  }) =>
      AppColors(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        textColor: textColor ?? this.textColor,
        primaryColor: primaryColor ?? this.primaryColor,
        secondaryColor: secondaryColor ?? this.secondaryColor,
        errorColor: errorColor ?? this.errorColor,
        borderColor: borderColor ?? this.borderColor,
        ratingActiveColor: ratingActiveColor ?? this.ratingActiveColor,
        ratingInactiveColor: ratingInactiveColor ?? this.ratingInactiveColor,
      );

  @override
  ThemeExtension<AppColors> lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      errorColor: Color.lerp(errorColor, other.errorColor, t),
      borderColor: Color.lerp(borderColor, other.borderColor, t),
      ratingActiveColor: Color.lerp(ratingActiveColor, other.ratingActiveColor, t),
      ratingInactiveColor: Color.lerp(ratingInactiveColor, other.ratingInactiveColor, t),
    );
  }
}
