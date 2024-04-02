import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:tourist_app/core/di.dart';
import 'package:tourist_app/core/localization_extension.dart';
import 'package:tourist_app/core/style/style_extensions.dart';
import 'package:tourist_app/features/locations/presentation/controller/list/list_state.dart';
import 'package:tourist_app/features/locations/presentation/widget/list/empty_state_widget.dart';
import 'package:tourist_app/features/locations/presentation/widget/list/error_state_widget.dart';
import 'package:tourist_app/features/locations/presentation/widget/list/sight_card.dart';

class SightsScreen extends ConsumerWidget {
  const SightsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sightListState = ref.watch(sightListProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.localSights, style: context.textTitle),
              const SizedBox(height: 20),
              Expanded(
                child: switch (sightListState) {
                  ListStateLoading() => Center(
                      child: Lottie.asset('assets/animations/loading_sights.json', height: 65),
                    ),
                  ListStateEmpty() => const EmptyStateWidget(),
                  ListStateError() => const ErrorStateWidget(),
                  ListStateSuccess(sightList: final list) => ListView.separated(
                      itemCount: list.length,
                      separatorBuilder: (context, _) => const SizedBox(height: 20),
                      itemBuilder: (context, index) => SightCard(sight: list[index]),
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
