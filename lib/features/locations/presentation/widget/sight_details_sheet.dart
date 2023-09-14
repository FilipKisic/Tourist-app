import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tourist_app/core/presentation/style/app_theme.dart';
import 'package:tourist_app/features/common/presentation/widget/primary_button.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';
import 'package:tourist_app/features/locations/presentation/widget/rating_stars.dart';

class SightDetailsSheet extends StatelessWidget {
  final Sight sight;

  const SightDetailsSheet({super.key, required this.sight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(sight.title, style: Theme.of(context).textTheme.title),
          Text(
            sight.address ?? AppLocalizations.of(context)!.noAddress,
            style: Theme.of(context).textTheme.standard,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 20),
          Text(AppLocalizations.of(context)!.rating),
          SizedBox(
            height: 30,
            child: RatingStars(
              inactiveColor: Theme.of(context).colorScheme.tertiaryContainer,
              rating: sight.rating,
              iconSize: 27,
            ),
          ),
          const SizedBox(height: 20),
          Text(sight.description ?? '', style: Theme.of(context).textTheme.description,),
          const Spacer(),
          PrimrayButton(
            onPressed: () {},
            text: AppLocalizations.of(context)!.showOnMaps,
            isLoading: false,
          ), //! Localization required
        ],
      ),
    );
  }
}
