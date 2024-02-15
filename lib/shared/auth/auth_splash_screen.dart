import 'package:ensa_campus/features/auth/domain/common/auth_state.dart';
import 'package:ensa_campus/features/auth/presentation/state/auth_provider.dart';
import 'package:ensa_campus/features/onboarding/presentation/pages/onboarding_steps_page.dart';
import 'package:ensa_campus/shared/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthSplashScreen extends ConsumerWidget {
  const AuthSplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authProvider, (previous, next) {
      if (next is AuthenticatedState) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => const LoggedInWidget(),
          ),
          (route) => false,
        );
      } else if (next is NotAuthenticatedState) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => OnboardingStepsPageWidget(),
          ),
          (route) => false,
        );
      }
    });

    return const SplashScreen();
  }
}

class LoggedInWidget extends ConsumerWidget {
  const LoggedInWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          child: const Text('Log out'),
          onPressed: () async {
            await ref.read(authProvider.notifier).logout();

            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => const AuthSplashScreen(),
              ),
              (route) => false,
            );
          },
        ),
      ),
    );
  }
}
