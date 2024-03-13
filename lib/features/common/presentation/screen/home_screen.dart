import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tourist_app/core/style/style_extensions.dart';
import 'package:tourist_app/features/locations/presentation/screen/favorites_screen.dart';
import 'package:tourist_app/features/locations/presentation/screen/sights_screen.dart';
import 'package:tourist_app/features/settings/presentation/screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex = 0;

  final _screens = const [
    SightsScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _screens[_selectedScreenIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        selectedItemColor: context.colorSecondary,
        onTap: (index) => setState(() => _selectedScreenIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.explore_outlined),
            activeIcon: const Icon(Icons.explore_rounded),
            label: AppLocalizations.of(context)!.sights,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_outline_rounded),
            activeIcon: const Icon(Icons.favorite_rounded),
            label: AppLocalizations.of(context)!.favorites,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline_rounded),
            activeIcon: const Icon(Icons.person_rounded),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
    );
  }
}
