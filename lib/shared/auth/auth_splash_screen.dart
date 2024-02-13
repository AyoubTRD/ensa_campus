import 'package:ensa_campus/di/di.dart';
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
    ref.listen(authProvider(sl()), (previous, next) {
      if (next is AuthenticatedState) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(
                child: Text('Authenticated'),
              ),
            ),
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
