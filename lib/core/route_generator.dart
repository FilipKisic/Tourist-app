import 'package:flutter/material.dart';
import 'package:tourist_app/core/presentation/screen/splash_screen.dart';
import 'package:tourist_app/features/auth/presentation/screen/login_screen.dart';
import 'package:tourist_app/features/auth/presentation/screen/registration_screen.dart';
import 'package:tourist_app/features/auth/presentation/screen/reset_password_screen.dart';
import 'package:tourist_app/features/common/presentation/screen/home_screen.dart';
import 'package:tourist_app/features/locations/presentation/screen/favorites_screen.dart';
import 'package:tourist_app/features/locations/presentation/screen/sights_screen.dart';
import 'package:tourist_app/features/settings/presentation/screen/settings_screen.dart';

class RouteGenerator {
  static const splashScreen = '/';
  static const loginScreen = '/login';
  static const registerScreen = '/registration';
  static const resetScreen = '/reset';
  static const homeScreen = '/home';
  static const sightsScreen = '/sights';
  static const settingsScreen = '/settings';
  static const favoritesScreen = '/favorites';

  RouteGenerator._();

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    switch(settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case resetScreen:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case sightsScreen:
        return MaterialPageRoute(builder: (_) => const SightsScreen());
      case settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case favoritesScreen:
        return MaterialPageRoute(builder: (_) => const FavoritesScreen());
      default:
        throw const RouteException('Route not defined...');
    }
  }
}

class RouteException implements Exception {
  final String cause;

  const RouteException(this.cause);
}