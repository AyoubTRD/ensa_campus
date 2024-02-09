import 'package:ensa_campus/features/auth/domain/common/auth_method.dart';
import 'package:ensa_campus/features/auth/presentation/widgets/social_auth_button_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Email address *",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                    ),
                    const Gap(24.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Password *",
                      ),
                      obscureText: true,
                    ),
                    const Gap(24.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Confirm password *",
                      ),
                      obscureText: true,
                    ),
                    const Gap(32.0),
                    SizedBox(
                      width: double.infinity,
                      height: 48.0,
                      child: FilledButton(
                        onPressed: handleSubmit,
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

  void goToSignIn() {}

  void handleSocialAuth(AuthMethod authMethod) {}

  void handleSubmit() {}
}
