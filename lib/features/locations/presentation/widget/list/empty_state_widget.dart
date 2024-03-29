import 'package:flutter/material.dart';
import 'package:tourist_app/core/localization_extension.dart';
import 'package:tourist_app/core/style/style_extensions.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Image(image: AssetImage('assets/images/login_image.png'), width: 150),
        const SizedBox(height: 20),
        Text(
          context.localEmptyListTitle,
          style: context.textStateTitle,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
          child: Text(
            context.localEmptyListDescription,
            style: context.textStandardLight,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
