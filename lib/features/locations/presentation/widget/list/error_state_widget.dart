import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tourist_app/core/presentation/style/app_theme.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('assets/images/error_404_image.png'),
        ),
        Text(
          AppLocalizations.of(context)!.thereWasAnError,
          style: Theme.of(context).textTheme.standard,
        ),
      ],
    );
  }
}
