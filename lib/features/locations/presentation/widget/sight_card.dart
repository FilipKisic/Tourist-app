import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/core/presentation/style/app_theme.dart';
import 'package:tourist_app/core/route_generator.dart';
import 'package:tourist_app/di.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';
import 'package:tourist_app/features/locations/presentation/widget/rating_stars.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SightCard extends ConsumerWidget {
  final Sight sight;

  const SightCard({super.key, required this.sight});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => _redirectToDetailsScreen(context, ref),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.maxFinite,
        height: 120,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              blurRadius: 10,
              color: Theme.of(context).shadowColor,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: const Image(
                image: AssetImage('assets/images/placeholder.jpg'),
                width: 130,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sight.title,
                    style: Theme.of(context).textTheme.cardTitle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    sight.address ?? AppLocalizations.of(context)!.noAddress,
                    style: Theme.of(context).textTheme.cardSubtitle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${sight.lat}, ${sight.lng}',
                    style: Theme.of(context).textTheme.cardSmall,
                  ),
                  const Spacer(),
                  Expanded(child: RatingStars(rating: sight.rating)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => print('Favorite pressed!'),
              child: const Icon(
                Icons.favorite_outline_rounded,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _redirectToDetailsScreen(final BuildContext context, final WidgetRef ref) {
    ref.read(sightProvider).selectSight(sight);
    Navigator.of(context).pushNamed(RouteGenerator.sightDetailsScreen);
  }
}
