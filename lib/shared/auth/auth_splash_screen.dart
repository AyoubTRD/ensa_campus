import 'package:ensa_campus/features/auth/domain/common/auth_state.dart';
import 'package:ensa_campus/features/auth/presentation/state/auth_provider.dart';
import 'package:ensa_campus/features/onboarding/presentation/pages/onboarding_steps_page.dart';
import 'package:ensa_campus/features/student/presentation/pages/basic_information_form_page.dart';
import 'package:ensa_campus/shared/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthSplashScreen extends ConsumerWidget {
  const AuthSplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    authState.whenOrNull(data: (data) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (data is AuthenticatedState) {
          print('User authenticated');
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (_) => BasicInformationFormPage(),
            ),
            (route) => false,
          );
        } else if (data is NotAuthenticatedState) {
          print('User not authenticated');
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (_) => OnboardingStepsPageWidget(),
            ),
            (route) => false,
          );
        }
      });
    });

    return const SplashScreen();
  }
}
