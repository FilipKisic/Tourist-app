import 'package:flutter/material.dart';
import 'package:tourist_app/core/style/colors.dart';
import 'package:tourist_app/core/style/text_styles.dart';

extension StyleExtension on BuildContext {
  Color get colorBackground => Theme.of(this).extension<AppColors>()!.backgroundColor!;
  Color get colorShadow => Theme.of(this).shadowColor;
  Color get colorText => Theme.of(this).extension<AppColors>()!.textColor!;
  Color get colorPrimary => Theme.of(this).extension<AppColors>()!.primaryColor!;
  Color get colorSecondary => Theme.of(this).extension<AppColors>()!.secondaryColor!;
  Color get colorError => Theme.of(this).extension<AppColors>()!.errorColor!;
  Color get colorBorder => Theme.of(this).extension<AppColors>()!.borderColor!;
  Color get colorRatingActive => Theme.of(this).extension<AppColors>()!.ratingActiveColor!;
  Color get colorRatingInactive => Theme.of(this).extension<AppColors>()!.ratingInactiveColor!;

  TextStyle get textAppBar => Theme.of(this).textTheme.appBar;
  TextStyle get textTitle => Theme.of(this).textTheme.title;
  TextStyle get textStandard => Theme.of(this).textTheme.standard;
  TextStyle get textStandardLight => Theme.of(this).textTheme.standard.copyWith(fontWeight: FontWeight.normal);
  TextStyle get textDescription => Theme.of(this).textTheme.description;
  TextStyle get textLabel => Theme.of(this).textTheme.label;
  TextStyle get textError => Theme.of(this).textTheme.error.copyWith(color: colorError);
  TextStyle get textSnackbar => Theme.of(this).textTheme.snackbar.copyWith(color: colorText);
  TextStyle get textButton => Theme.of(this).textTheme.buttonText;
  TextStyle get textCardTitle => Theme.of(this).textTheme.cardTitle;
  TextStyle get textCardSubtitle => Theme.of(this).textTheme.cardSubtitle;
  TextStyle get textCardSmall => Theme.of(this).textTheme.cardSmall;
  TextStyle get textHighlightStandard => Theme.of(this).textTheme.standard.copyWith(color: colorSecondary);
  TextStyle get textStateTitle => Theme.of(this).textTheme.stateTitle;
}
