import 'package:flutter/material.dart';
import 'package:tourist_app/core/presentation/screen/splash_screen.dart';
import 'package:tourist_app/features/auth/presentation/screen/login_screen.dart';
import 'package:tourist_app/features/auth/presentation/screen/registration_screen.dart';
import 'package:tourist_app/features/common/presentation/screen/home_screen.dart';
import 'package:tourist_app/features/locations/presentation/screen/places_screen.dart';

class RouteGenerator {
  static const splashScreen = '/';
  static const loginScreen = '/login';
  static const registerScreen = '/registration';
  static const homeScreen = '/home';
  static const placesScreen = '/places';

  RouteGenerator._();

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    switch(settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case placesScreen:
        return MaterialPageRoute(builder: (_) => const PlacesScreen());
      default:
        throw const RouteException('Route not defined...');
    }
  }
}

class RouteException implements Exception {
  final String cause;

  const RouteException(this.cause);
}