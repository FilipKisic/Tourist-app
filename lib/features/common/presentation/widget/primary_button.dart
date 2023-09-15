import 'package:flutter/material.dart';
import 'package:tourist_app/core/presentation/style/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        padding: EdgeInsets.zero,
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          constraints: const BoxConstraints(minHeight: 50.0),
          alignment: Alignment.center,
          child: isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
                  text,
                  style: Theme.of(context).textTheme.buttonText,
                ),
        ),
      ),
    );
  }
}
