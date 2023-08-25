import 'package:flutter/material.dart';

class PasswordVisibilityToggle extends StatelessWidget {
  final VoidCallback onTap;
  final bool isPasswordObscure;

  const PasswordVisibilityToggle({super.key, required this.onTap, required this.isPasswordObscure});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(isPasswordObscure ? Icons.visibility_rounded : Icons.visibility_off_rounded),
    );
  }
}
