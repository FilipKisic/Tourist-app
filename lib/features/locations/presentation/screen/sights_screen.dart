import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/di.dart';

class SightsScreen extends ConsumerWidget {
  const SightsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sightListState = ref.watch(sightProvider.select((provider) => provider.sightListState));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.sights,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: sightListState!.when(
                  loading: () => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  error: (error, _) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/images/error_404_image.png'),
                      ),
                      Text(
                        AppLocalizations.of(context)!.thereWasAnError,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  data: (list) => ListView.separated(
                    itemCount: list.length,
                    separatorBuilder: (context, _) => const SizedBox(height: 10),
                    itemBuilder: (context, index) => Container(
                      color: Colors.amber,
                      child: Text('Title: ${list[index].name}'),
                    ),
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
