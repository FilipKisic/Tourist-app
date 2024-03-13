import 'package:flutter/material.dart';
import 'package:tourist_app/core/localization_extension.dart';
import 'package:tourist_app/core/style/style_extensions.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(image: AssetImage('assets/images/login_image.png'), width: 100),
        Text(context.localEmptyState, style: context.textStandard),
      ],
    );
  }
}
