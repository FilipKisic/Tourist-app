import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/core/localization_extension.dart';
import 'package:tourist_app/core/route_generator.dart';
import 'package:tourist_app/core/style/style_extensions.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';
import 'package:tourist_app/features/locations/presentation/widget/rating_stars.dart';

class SightCard extends ConsumerWidget {
  final Sight sight;

  const SightCard({super.key, required this.sight});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => _redirectToDetailsScreen(context),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.maxFinite,
        height: 120,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.colorPrimary,
              context.colorSecondary,
            ],
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              blurRadius: 10,
              color: context.colorShadow,
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
                    style: context.textCardTitle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    sight.address ?? context.localNoAddress,
                    style: context.textCardSubtitle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${sight.lat}, ${sight.lng}',
                    style: context.textCardSmall,
                  ),
                  const Spacer(),
                  Expanded(child: RatingStars(rating: sight.rating)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => log('Favorite pressed!'),
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

  void _redirectToDetailsScreen(final BuildContext context) =>
      Navigator.of(context).pushNamed(RouteGenerator.sightDetailsScreen, arguments: sight);
}
