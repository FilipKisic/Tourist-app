import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tourist_app/features/auth/presentation/widget/custom_text_form_field.dart';
import 'package:tourist_app/features/common/presentation/widget/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                      child: Image(image: AssetImage('assets/images/login_image.png')),
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
                      validator: _validateEmail,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: _passwordController,
                      label: AppLocalizations.of(context).password,
                      isObscure: true,
                      validator: _validatePassword,
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
                          onTap: () {},
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

  String? _validateEmail(final String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context).emailEmptyValidation;
    }
    if (_isNotValidEmailAddress(value)) {
      return AppLocalizations.of(context).emailAddressValidation;
    }
    return null;
  }

  bool _isNotValidEmailAddress(final String value) => !RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(value);

  String? _validatePassword(final String? value) =>
      value == null || value.isEmpty ? AppLocalizations.of(context).passwordEmptyValidation : null;

  void _login() => print('${_emailController.text} ${_passwordController.text}');
}
