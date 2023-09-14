import 'package:flutter/material.dart';
import 'package:tourist_app/core/presentation/style/app_theme.dart';

class CustomSnackBar {
  const CustomSnackBar._();

  static void show(BuildContext context, final String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_rounded, color: Theme.of(context).colorScheme.secondary,),
            const SizedBox(width: 5),
            Text(text, style: Theme.of(context).textTheme.snackbar),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 30),
        elevation: 5,
        padding: const EdgeInsets.all(20),
      ),
    );
  }
}
