import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tourist_app/core/route_generator.dart';
import 'package:tourist_app/features/auth/presentation/util/utils.dart';
import 'package:tourist_app/features/auth/presentation/widget/custom_text_form_field.dart';
import 'package:tourist_app/features/common/presentation/widget/custom_snackbar.dart';
import 'package:tourist_app/features/common/presentation/widget/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      AppLocalizations.of(context).signInTitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: _emailController,
                      label: AppLocalizations.of(context).email,
                      textInputAction: TextInputAction.next,
                      validator: (value) => validateEmail(context, value),
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: _passwordController,
                      label: AppLocalizations.of(context).password,
                      isObscure: true,
                      validator: (value) => validatePassword(context, value),
                    ),
                    const SizedBox(height: 40),
                    PrimrayButton(
                      onPressed: () => _login(),
                      text: AppLocalizations.of(context).signIn,
                    ),
                    const SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppLocalizations.of(context).dontHaveAnAccount),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () => _redirectToRegisterScreen(context),
                          child: Text(
                            AppLocalizations.of(context).signUp,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
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

  void _login() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (_formKey.currentState!.validate()) {
      //redirect to the main screen
    } else {
      CustomSnackBar.show(context, AppLocalizations.of(context).wrongEmailOrPassword);
    }
  }

  void _redirectToRegisterScreen(final BuildContext context) =>
      Navigator.of(context).pushNamed(RouteGenerator.registerScreen);
}
