import 'package:flutter/material.dart';
import 'package:tourist_app/core/localization_extension.dart';
import 'package:tourist_app/core/style/style_extensions.dart';
import 'package:tourist_app/features/common/presentation/widget/primary_button.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';
import 'package:tourist_app/features/locations/presentation/util/map_utils.dart';
import 'package:tourist_app/features/locations/presentation/widget/rating_stars.dart';

class SightDetailsSheet extends StatelessWidget {
  final Sight sight;

  const SightDetailsSheet({super.key, required this.sight});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: context.colorBackground,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(sight.title, style: context.textTitle),
              Text(
                sight.address ?? context.localNoAddress,
                style: context.textStandard,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 20),
              Text(context.localRating),
              SizedBox(
                height: 30,
                child: RatingStars(
                  inactiveColor: context.colorRatingInactive,
                  rating: sight.rating,
                  iconSize: 27,
                ),
              ),
              const SizedBox(height: 20),
              Text(sight.description ?? '', style: context.textDescription),
              const Spacer(),
              PrimaryButton(
                onPressed: () => MapUtils.openLocationInMaps(sight.lat, sight.lng, sight.title),
                text: context.localShowOnMaps,
                isLoading: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
