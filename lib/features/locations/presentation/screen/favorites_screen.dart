import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/core/di.dart';
import 'package:tourist_app/core/localization_extension.dart';
import 'package:tourist_app/core/style/style_extensions.dart';
import 'package:tourist_app/features/locations/presentation/controller/favorite_list/favorite_list_state.dart';
import 'package:tourist_app/features/locations/presentation/widget/favorites/empty_favorites_widget.dart';
import 'package:tourist_app/features/locations/presentation/widget/list/sight_card.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteListState = ref.watch(favoriteListProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.localFavorites, style: context.textTitle),
              const SizedBox(height: 20),
              Expanded(
                child: switch (favoriteListState) {
                  FavoriteListStateEmpty() => const EmptyFavoritesWidget(),
                  FavoriteListStateFavorites(favorites: final favorites) => ListView.separated(
                      itemCount: favorites.length,
                      separatorBuilder: (context, _) => const SizedBox(height: 20),
                      itemBuilder: (context, index) => SightCard(sight: favorites[index]),
                    ),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
