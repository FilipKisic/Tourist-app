import 'package:flutter/material.dart';
import 'package:tourist_app/core/style/style_extensions.dart';

class CustomSnackBar {
  const CustomSnackBar._();

  static void show(BuildContext context, final String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_rounded, color: context.colorSecondary),
            const SizedBox(width: 5),
            Text(text, style: context.textSnackbar),
          ],
        ),
        backgroundColor: context.colorBackground,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: context.colorSecondary, width: 2),
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
