import 'package:flutter/material.dart';
import 'package:tourist_app/core/presentation/screen/splash_screen.dart';
import 'package:tourist_app/features/auth/presentation/screen/login_screen.dart';

class RouteGenerator {
  static const splashScreen = '/splash';
  static const loginScreen = '/';

  RouteGenerator._();

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    switch(settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        throw const RouteException('Route not defined...');
    }
  }
}

class RouteException implements Exception {
  final String cause;

  const RouteException(this.cause);
}