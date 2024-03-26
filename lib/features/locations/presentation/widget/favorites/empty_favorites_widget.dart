import 'package:flutter/widgets.dart';
import 'package:tourist_app/core/localization_extension.dart';
import 'package:tourist_app/core/style/style_extensions.dart';

class EmptyFavoritesWidget extends StatelessWidget {
  const EmptyFavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/empty_favorites.png',
          width: 220,
        ),
        Text(
          context.localEmptyFavoriteTitle,
          style: context.textStateTitle,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            context.localEmptyFavoriteDescription,
            style: context.textStandardLight,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
