import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tourist_app/core/route_generator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _redirectToNextScreen(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(50.0),
              child: Image(image: AssetImage('assets/images/camping_image.png')),
            ),
            Lottie.asset('assets/animations/loading_dots.json', height: 100),
          ],
        ),
      ),
    );
  }
}

void _redirectToNextScreen(final BuildContext context) =>
    Future.delayed(const Duration(milliseconds: 1500))
        .then((_) => Navigator.of(context).pushNamed(RouteGenerator.loginScreen));
