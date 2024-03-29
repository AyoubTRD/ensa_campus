import 'package:ensa_campus/features/auth/domain/common/auth_method.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_method_params.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_state.dart';
import 'package:ensa_campus/features/auth/domain/common/failures/auth_failures.dart';
import 'package:ensa_campus/features/auth/presentation/pages/signin_page.dart';
import 'package:ensa_campus/features/auth/presentation/state/auth_provider.dart';
import 'package:ensa_campus/features/auth/presentation/state/signup_provider.dart';
import 'package:ensa_campus/features/auth/presentation/widgets/social_auth_button_widget.dart';
import 'package:ensa_campus/shared/auth/auth_splash_screen.dart';
import 'package:ensa_campus/shared/common/error/failure.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  String? _password;

  bool _formSubmitted = false;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    authState.whenOrNull(
      data: (state) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (state is AuthenticatedState) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => const AuthSplashScreen(),
              ),
              (route) => false,
            );
          }
        });
      },
    );

    ref.listen(signupProvider, (_, signupState) {
      signupState.whenOrNull(
        error: (e, s) {
          late final String text;
          if (e is AuthFailure) {
            text = e.message ?? 'Failed to sign up, please try again';
          } else if (e is Failure) {
            text = e.message ?? 'Something went wrong, please try again';
          } else {
            text = 'Something went wrong';
          }
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
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
    });
    final signupState = ref.watch(signupProvider);

    return Scaffold(
        appBar: AppBar(
          title: const FlutterLogo(),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                FormBuilder(
                  key: _formKey,
                  autovalidateMode: _formSubmitted
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  child: Column(
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
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        name: 'password',
                        decoration: const InputDecoration(
                          labelText: "Password *",
                        ),
                        obscureText: true,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(8),
                        ]),
                      ),
                      const Gap(24.0),
                      FormBuilderTextField(
                        name: "confirm_password",
                        decoration: const InputDecoration(
                          labelText: "Confirm password *",
                        ),
                        obscureText: true,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.equal(
                            _password ?? '',
                            errorText: 'The passwords do not match',
                          ),
                        ]),
                      ),
                      const Gap(32.0),
                      SizedBox(
                        width: double.infinity,
                        height: 48.0,
                        child: FilledButton(
                          onPressed: signupState.isLoading
                              ? null
                              : () {
                                  handleSubmit();
                                },
                          child: const Text('Create account'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16.0),
                        width: 48.0,
                        height: 1.0,
                        color: Theme.of(context).colorScheme.surfaceVariant,
                      ),
                      const Text('Or create an account with'),
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
                ),
                // Bottom text
                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: Theme.of(context).textTheme.labelLarge,
                    children: [
                      TextSpan(
                        text: "Sign in",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                        recognizer: TapGestureRecognizer()..onTap = goToSignIn,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void goToSignIn() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignInPage()));
  }

  void handleSocialAuth(AuthMethod authMethod) {}

  Future<void> handleSubmit() async {
    setState(() {
      _formSubmitted = true;
    });

    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final email = _formKey.currentState?.fields['email']?.value;
      final password = _formKey.currentState?.fields['password']?.value;

      await ref.read(signupProvider.notifier).signup<ManualEntryAuthMethod>(
            RegisterManualEntryAuthParams(
              email: email,
              password: password,
            ),
          );
    }
  }
}
