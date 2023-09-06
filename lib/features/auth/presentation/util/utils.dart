import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String? validateEmail(final BuildContext context, final String? value) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.emailEmptyValidation;
  }
  if (_isNotValidEmailAddress(value)) {
    return AppLocalizations.of(context)!.emailAddressValidation;
  }
  return null;
}

bool _isNotValidEmailAddress(final String value) => !RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
    .hasMatch(value);

String? validatePassword(final BuildContext context, final String? value) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.passwordEmptyValidation;
  } else if (value.length < 8) {
    return AppLocalizations.of(context)!.passwordLengthValidation;
  } else {
    return null;
  }
}

bool doPasswordsMatch(final String password, final String confirmPassword) =>
    password == confirmPassword;
