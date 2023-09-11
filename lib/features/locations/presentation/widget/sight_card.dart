import 'package:flutter/material.dart';
import 'package:tourist_app/features/locations/presentation/widget/rating_stars.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SightCard extends StatelessWidget {
  final String title;
  final String? address;
  final double lat;
  final double lng;
  final int rating;

  const SightCard({
    super.key,
    required this.title,
    required this.address,
    required this.lat,
    required this.lng,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  title,
                  style: Theme.of(context).textTheme.displayLarge,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  address ?? AppLocalizations.of(context)!.noAddress,
                  style: Theme.of(context).textTheme.displayMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  '$lat, $lng',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const Spacer(),
                Expanded(child: RatingStars(rating: rating)),
              ],
            ),
          ),
          const Icon(
            Icons.favorite_outline_rounded,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
