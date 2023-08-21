import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tourist_app/features/auth/presentation/util/utils.dart';
import 'package:tourist_app/features/auth/presentation/widget/custom_text_form_field.dart';
import 'package:tourist_app/features/common/presentation/widget/primary_button.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.chevron_left_rounded),
        ),
        title: Text(
          AppLocalizations.of(context).signUp,
          style: Theme.of(context).textTheme.titleMedium,
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
                      textInputAction: TextInputAction.next,
                      isObscure: true,
                      validator: (value) => validatePassword(context, value),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: _confirmPasswordController,
                      label: AppLocalizations.of(context).password,
                      isObscure: true,
                      validator: (value) => validatePassword(context, value),
                    ),
                    const SizedBox(height: 40),
                    PrimrayButton(
                      onPressed: () => _register(),
                      text: AppLocalizations.of(context).signUp,
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

  void _register() {
    if (_formKey.currentState!.validate()) {
      if (doPasswordsMatch(_passwordController.text, _confirmPasswordController.text)) {
        print(
            '${_emailController.text} ${_passwordController.text} ${_confirmPasswordController.text}');
      } else {
        //show snackbar
      }
    }
  }
}
