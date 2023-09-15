import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const CircularIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(30.0),
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: Center(
              child: Icon(
                icon,
                size: 25.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
