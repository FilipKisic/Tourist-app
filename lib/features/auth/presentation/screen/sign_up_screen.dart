import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/core/di.dart';
import 'package:tourist_app/core/error/failure.dart';
import 'package:tourist_app/core/presentation/style/app_theme.dart';
import 'package:tourist_app/core/route_generator.dart';
import 'package:tourist_app/features/auth/presentation/util/utils.dart';
import 'package:tourist_app/features/auth/presentation/widget/custom_text_form_field.dart';
import 'package:tourist_app/features/auth/presentation/widget/password_visibilty_toggle.dart';
import 'package:tourist_app/features/common/presentation/widget/custom_snackbar.dart';
import 'package:tourist_app/features/common/presentation/widget/primary_button.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordObscure = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    ref.listen(authNotifier, (_, state) {
      state.when(
        unauthenticated: (error, fromSignIn) {
          setState(() => _isLoading = false);
          if (!fromSignIn) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => _showErrorOnSnackBar(error!),
            );
          }
        },
        loading: () => setState(() => _isLoading = true),
        authenticated: (_) {
          setState(() => _isLoading = false);
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => Navigator.of(context)
                .pushNamedAndRemoveUntil(RouteGenerator.homeScreen, (_) => false),
          );
        },
      );
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.chevron_left_rounded),
        ),
        title: Text(
          AppLocalizations.of(context)!.signUp,
          style: Theme.of(context).textTheme.appBarTitle,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 120, vertical: 30),
                      child: Hero(
                        tag: 'login_image',
                        child: Image(image: AssetImage('assets/images/login_image.png')),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.signUpTitle,
                      style: Theme.of(context).textTheme.standard,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: _emailController,
                      label: AppLocalizations.of(context)!.email,
                      textInputAction: TextInputAction.next,
                      validator: (value) => validateEmail(context, value),
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: _passwordController,
                      label: AppLocalizations.of(context)!.password,
                      textInputAction: TextInputAction.next,
                      isObscure: _isPasswordObscure,
                      validator: (value) => validatePassword(context, value),
                      suffixIcon: PasswordVisibilityToggle(
                        onTap: () => setState(() => _isPasswordObscure = !_isPasswordObscure),
                        isPasswordObscure: _isPasswordObscure,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: _confirmPasswordController,
                      label: AppLocalizations.of(context)!.password,
                      isObscure: _isPasswordObscure,
                      validator: (value) => validatePassword(context, value),
                      suffixIcon: PasswordVisibilityToggle(
                        onTap: () => setState(() => _isPasswordObscure = !_isPasswordObscure),
                        isPasswordObscure: _isPasswordObscure,
                      ),
                    ),
                    const SizedBox(height: 40),
                    PrimaryButton(
                      onPressed: _register,
                      isLoading: _isLoading,
                      text: AppLocalizations.of(context)!.signUp,
                    ),
                    const SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.alreadyHaveAnAccount,
                          style: Theme.of(context).textTheme.standard,
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: _redirectToLoginScreen,
                          child: Text(
                            AppLocalizations.of(context)!.signIn,
                            style: Theme.of(context)
                                .textTheme
                                .standard
                                .copyWith(color: Theme.of(context).colorScheme.secondary),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _showErrorOnSnackBar(final Failure error) {
    error.when(
      networkError: () =>
          CustomSnackBar.show(context, AppLocalizations.of(context)!.thereWasAnError),
      generalError: () =>
          CustomSnackBar.show(context, AppLocalizations.of(context)!.thereWasAnError),
      firebaseError: (code) {
        if (code == 'weak-password') {
          CustomSnackBar.show(context, AppLocalizations.of(context)!.passwordComplexityValidation);
        } else if (code == 'email-already-in-use') {
          CustomSnackBar.show(context, AppLocalizations.of(context)!.emailAlreadyExists);
        } else {
          CustomSnackBar.show(context, AppLocalizations.of(context)!.thereWasAnError);
        }
      },
    );
  }

  void _register() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (_formKey.currentState!.validate()) {
      if (doPasswordsMatch(_passwordController.text, _confirmPasswordController.text)) {
        ref.read(authNotifier.notifier).register(
              _emailController.text.trim(),
              _passwordController.text.trim(),
            );
      } else {
        CustomSnackBar.show(context, AppLocalizations.of(context)!.passwordsDoNotMatch);
      }
    }
  }

  void _redirectToLoginScreen() => Navigator.of(context).pop();
}
