import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/core/presentation/style/app_theme.dart';
import 'package:tourist_app/core/di.dart';
import 'package:tourist_app/features/auth/presentation/widget/custom_text_form_field.dart';
import 'package:tourist_app/features/common/presentation/widget/custom_snackbar.dart';
import 'package:tourist_app/features/common/presentation/widget/primary_button.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final resetState = ref.watch(userProvider.select((provider) => provider.resetPasswordState));

    ref.listen(userProvider.select((provider) => provider.resetPasswordState), (_, state) {
      state?.whenOrNull(
        data: (_) => WidgetsBinding.instance.addPostFrameCallback(
          (_) => CustomSnackBar.show(context, AppLocalizations.of(context)!.verificationEmail),
        ),
        error: (error, _) => WidgetsBinding.instance.addPostFrameCallback(
          (_) => CustomSnackBar.show(context, error.toString()),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.chevron_left_rounded),
        ),
        title: Text(
          AppLocalizations.of(context)!.resetPassword,
          style: Theme.of(context).textTheme.appBarTitle,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 30),
                child: Image(image: AssetImage('assets/images/reset_password_email.png')),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                child: Text(
                  AppLocalizations.of(context)!.resetPasswordTitle,
                  style: Theme.of(context).textTheme.standard,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                controller: _emailController,
                label: AppLocalizations.of(context)!.email,
              ),
              const SizedBox(height: 30),
              PrimaryButton(
                onPressed: () => ref.read(userProvider).resetPassword(_emailController.text.trim()),
                text: AppLocalizations.of(context)!.reset,
                isLoading: resetState is AsyncLoading<void>,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
