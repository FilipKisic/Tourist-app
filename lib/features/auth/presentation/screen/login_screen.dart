import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/core/presentation/style/app_theme.dart';
import 'package:tourist_app/core/route_generator.dart';
import 'package:tourist_app/di.dart';
import 'package:tourist_app/features/auth/presentation/util/utils.dart';
import 'package:tourist_app/features/auth/presentation/widget/custom_text_form_field.dart';
import 'package:tourist_app/features/auth/presentation/widget/password_visibilty_toggle.dart';
import 'package:tourist_app/features/common/presentation/widget/custom_snackbar.dart';
import 'package:tourist_app/features/common/presentation/widget/primary_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userProvider.select((provider) => provider.userAuthState));

    ref.listen(userProvider.select((provider) => provider.userAuthState), (_, state) {
      state?.whenOrNull(
        data: (_) => WidgetsBinding.instance.addPostFrameCallback(
          (_) => Navigator.of(context).pushReplacementNamed(RouteGenerator.homeScreen),
        ),
        error: (error, _) => WidgetsBinding.instance.addPostFrameCallback(
          (_) => CustomSnackBar.show(
            context,
            AppLocalizations.of(context)!.wrongEmailOrPassword,
          ),
        ),
      );
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                      child: Hero(
                        tag: 'login_image',
                        child: Image(image: AssetImage('assets/images/login_image.png')),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.signInTitle,
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
                      isObscure: _isPasswordObscure,
                      validator: (value) => validatePassword(context, value),
                      suffixIcon: PasswordVisibilityToggle(
                        onTap: () => setState(() => _isPasswordObscure = !_isPasswordObscure),
                        isPasswordObscure: _isPasswordObscure,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(RouteGenerator.resetScreen),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Text(
                            AppLocalizations.of(context)!.forgotPassword,
                            style: Theme.of(context).textTheme.standard,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    PrimaryButton(
                      onPressed: () => _login(),
                      isLoading: userState is AsyncLoading<void>,
                      text: AppLocalizations.of(context)!.signIn,
                    ),
                    const SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.dontHaveAnAccount,
                          style: Theme.of(context).textTheme.standard,
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: _redirectToRegisterScreen,
                          child: Text(
                            AppLocalizations.of(context)!.createAccount,
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
    super.dispose();
  }

  void _login() async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (_formKey.currentState!.validate()) {
      await ref.read(userProvider).loginUser(
            _emailController.text.trim(),
            _passwordController.text.trim(),
          );
    }
  }

  void _redirectToRegisterScreen() =>
      Navigator.of(context).pushReplacementNamed(RouteGenerator.registerScreen);
}
