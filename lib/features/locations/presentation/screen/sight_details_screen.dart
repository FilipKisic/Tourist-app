import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourist_app/core/di.dart';
import 'package:tourist_app/core/style/style_extensions.dart';
import 'package:tourist_app/features/common/presentation/widget/icon_button.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';
import 'package:tourist_app/features/locations/presentation/widget/sight_details_sheet.dart';

class SightDetailsScreen extends HookConsumerWidget {
  const SightDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sight = ModalRoute.of(context)!.settings.arguments as Sight;
    var isFavorite = useState(sight.isFavorite);

    return Scaffold(
      backgroundColor: context.colorBackground,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Image(
                image: NetworkImage(sight.imageUrl),
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 50,
              left: 30,
              child: Container(
                decoration: BoxDecoration(
                  color: context.colorBackground,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.chevron_left_rounded),
                  iconSize: 30,
                  color: context.colorSecondary,
                ),
              ),
            ),
            Positioned(bottom: 0, child: SightDetailsSheet(sight: sight)),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.33,
              right: 40,
              child: CircularIconButton(
                onPressed: () {
                  isFavorite.value
                      ? ref.read(favoriteListProvider.notifier).removeFavorite(sight)
                      : ref.read(favoriteListProvider.notifier).setFavorite(sight);
                  isFavorite.value = !isFavorite.value;
                },
                icon: isFavorite.value ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
