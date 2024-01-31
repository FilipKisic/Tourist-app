import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/features/common/presentation/widget/icon_button.dart';
import 'package:tourist_app/features/locations/domain/entity/sight.dart';
import 'package:tourist_app/features/locations/presentation/widget/sight_details_sheet.dart';

class SightDetailsScreen extends ConsumerWidget {
  const SightDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sight = ModalRoute.of(context)!.settings.arguments as Sight;
    
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              child: Image(
                image: AssetImage('assets/images/placeholder.jpg'),
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 50,
              left: 30,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.chevron_left_rounded),
                  iconSize: 30,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SightDetailsSheet(sight: sight),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.33,
              right: 40,
              child: CircularIconButton(onPressed: () {}, icon: Icons.favorite_outline_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
