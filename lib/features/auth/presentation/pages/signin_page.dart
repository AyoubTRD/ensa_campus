import 'package:ensa_campus/features/auth/domain/common/auth_method.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_method_params.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_state.dart';
import 'package:ensa_campus/features/auth/domain/common/failures/auth_failures.dart';
import 'package:ensa_campus/features/auth/presentation/pages/signup_page.dart';
import 'package:ensa_campus/features/auth/presentation/state/auth_provider.dart';
import 'package:ensa_campus/features/auth/presentation/state/login_provider.dart';
import 'package:ensa_campus/features/auth/presentation/widgets/social_auth_button_widget.dart';
import 'package:ensa_campus/features/student/presentation/pages/basic_information_form_page.dart';
import 'package:ensa_campus/shared/auth/auth_splash_screen.dart';
import 'package:ensa_campus/shared/common/error/failure.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool _formSubmitted = false;

  @override
  Widget build(BuildContext context) {
    ref.listen(authProvider, (previous, next) {
      next.when(
        data: (state) {
          if (state is AuthenticatedState) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => const AuthSplashScreen(),
              ),
              (route) => false,
            );
          }
        },
        error: (e, s) {},
        loading: () {},
      );
    });

    ref.listen(loginProvider, (previous, next) {
      if (previous != next) {
        next.whenOrNull(
          error: (e, s) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              late final String text;
              if (e is AuthFailure) {
                text = e.message ?? 'Failed to sign in, please try again';
              } else if (e is Failure) {
                text = e.message ?? 'Something went wrong, please try again';
              } else {
                text = 'Something went wrong';
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).colorScheme.error,
                  content: Text(
                    text,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onError,
                    ),
                  ),
                ),
              );
            });
          },
        );
      }
    });
    final loginState = ref.watch(loginProvider);

    return Scaffold(
      appBar: AppBar(
        title: const FlutterLogo(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FormBuilder(
            key: _formKey,
            autovalidateMode: _formSubmitted
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Column(
                  children: [
                    FormBuilderTextField(
                      name: 'email',
                      decoration: const InputDecoration(
                        labelText: "Email address *",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    const Gap(24.0),
                    FormBuilderTextField(
                      name: 'password',
                      decoration: const InputDecoration(
                        labelText: "Password *",
                      ),
                      obscureText: true,
                      validator: FormBuilderValidators.required(),
                    ),
                    const Gap(32.0),
                    SizedBox(
                      width: double.infinity,
                      height: 48.0,
                      child: FilledButton(
                        onPressed:
                            loginState.isLoading ? null : () => handleSubmit(),
                        child: loginState.isLoading
                            ? const CircularProgressIndicator()
                            : const Text('Sign in'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16.0),
                      width: 48.0,
                      height: 1.0,
                      color: Theme.of(context).colorScheme.surfaceVariant,
                    ),
                    const Text('Or sign in with'),
                    const Gap(8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialAuthButton(
                          GoogleAuthMethod(),
                          onPressed: handleSocialAuth,
                        ),
                        const Gap(16.0),
                        SocialAuthButton(
                          AppleAuthMethod(),
                          onPressed: handleSocialAuth,
                        ),
                      ],
                    ),
                  ],
                ),
                // Bottom text
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.labelLarge,
                    children: [
                      TextSpan(
                        text: "Create one",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                        recognizer: TapGestureRecognizer()..onTap = goToSignUp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void goToSignUp() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SignUpPage(),
      ),
    );
  }

  void handleSocialAuth(AuthMethod authMethod) {}

  Future<void> handleSubmit() async {
    setState(() {
      _formSubmitted = true;
    });

    if (_formKey.currentState!.saveAndValidate()) {
      final email = _formKey.currentState!.value['email'] as String;
      final password = _formKey.currentState!.value['password'] as String;

      await ref.read(loginProvider.notifier).login<ManualEntryAuthMethod>(
            LoginManualEntryAuthParams(
              email: email.trim(),
              password: password,
            ),
          );
    }
  }
}
