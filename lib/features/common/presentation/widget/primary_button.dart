import 'package:flutter/material.dart';

class PrimrayButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const PrimrayButton({super.key, required this.onPressed, required this.text});

  /* @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.purple,
      highlightColor: Colors.red,
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                blurRadius: 5,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              )
            ]),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
    );
  } */
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          constraints: const BoxConstraints(minHeight: 50.0),
          alignment: Alignment.center,
          child: const Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
