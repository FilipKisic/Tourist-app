import 'package:flutter/material.dart';
import 'package:tourist_app/core/localization_extension.dart';
import 'package:tourist_app/core/style/style_extensions.dart';
import 'package:tourist_app/features/locations/presentation/widget/favorites/empty_favorites_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.localFavorites, style: context.textTitle),
              const Expanded(child: EmptyFavoritesWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
