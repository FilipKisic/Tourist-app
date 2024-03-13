import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/core/di.dart';
import 'package:tourist_app/core/localization_extension.dart';
import 'package:tourist_app/core/style/style_extensions.dart';
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
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    ref.listen(resetPasswordNotifier, (_, state) {
      state.when(
        loading: () => _isLoading = true,
        data: (_) {
          _isLoading = false;
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => CustomSnackBar.show(context, context.localVerificationEmail),
          );
        },
        error: (error, _) {
          _isLoading = false;
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => CustomSnackBar.show(context, error.toString()),
          );
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.chevron_left_rounded),
        ),
        title: Text(context.localResetPassword, style: context.textAppBar),
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
                  context.localResetPasswordTitle,
                  style: context.textStandard,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                controller: _emailController,
                label: context.localEmail,
              ),
              const SizedBox(height: 30),
              PrimaryButton(
                onPressed: () => ref
                    .read(resetPasswordNotifier.notifier)
                    .resetPassword(_emailController.text.trim()),
                text: context.localReset,
                isLoading: _isLoading,
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
