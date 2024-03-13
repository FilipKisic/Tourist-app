import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourist_app/features/common/presentation/widget/primary_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')), //!Localize
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Profile'),
              PrimaryButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                text: 'Sign out',
                isLoading: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
