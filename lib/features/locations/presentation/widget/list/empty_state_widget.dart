import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tourist_app/core/presentation/style/app_theme.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(image: AssetImage('assets/images/login_image.png'), width: 100),
        Text(
          AppLocalizations.of(context)!.emptyState,
          style: Theme.of(context).textTheme.standard,
        ),
      ],
    );
  }
}
