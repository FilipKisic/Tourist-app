import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/core/di.dart';
import 'package:tourist_app/core/localization_extension.dart';
import 'package:tourist_app/core/style/style_extensions.dart';
import 'package:tourist_app/features/common/presentation/widget/primary_button.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.read(authNotifier.notifier).currentUser;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(context.localProfile, style: context.textTitle),
              const Spacer(),
              Center(
                child: Text(
                  currentUser?.email ?? 'No email',
                  style: context.textStandard,
                ),
              ),
              const Spacer(),
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
