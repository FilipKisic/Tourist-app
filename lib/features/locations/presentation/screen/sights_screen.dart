import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:tourist_app/core/presentation/style/app_theme.dart';
import 'package:tourist_app/di.dart';
import 'package:tourist_app/features/locations/presentation/widget/sight_card.dart';

class SightsScreen extends ConsumerWidget {
  const SightsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sightListState = ref.watch(sightProvider.select((provider) => provider.sightListState));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.sights,
                style: Theme.of(context).textTheme.title,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: sightListState!.when(
                  loading: () => Center(
                    child: Lottie.asset('assets/animations/loading_sights.json', height: 65),
                  ),
                  error: (error, _) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/images/error_404_image.png'),
                      ),
                      Text(
                        AppLocalizations.of(context)!.thereWasAnError,
                        style: Theme.of(context).textTheme.standard,
                      ),
                    ],
                  ),
                  data: (list) => ListView.separated(
                    itemCount: list.length,
                    physics: const ClampingScrollPhysics(),
                    separatorBuilder: (context, _) => const SizedBox(height: 20),
                    itemBuilder: (context, index) => SightCard(sight: list[index]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
