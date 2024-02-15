import 'package:ensa_campus/features/auth/presentation/pages/signin_page.dart';
import 'package:ensa_campus/features/auth/presentation/pages/signup_page.dart';
import 'package:ensa_campus/features/onboarding/domain/entities/onboarding_step_entity.dart';
import 'package:ensa_campus/features/onboarding/presentation/state/onboarding_provider.dart';
import 'package:ensa_campus/features/onboarding/presentation/state/onboarding_state.dart';
import 'package:ensa_campus/features/onboarding/presentation/state/onboarding_steps.dart';
import 'package:ensa_campus/shared/widgets/page_view_page_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class OnboardingStepWidget extends ConsumerWidget {
  final OnboardingStepEntity info;

  const OnboardingStepWidget(this.info, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingProvider(onboardingSteps));

    const double imageHeight = 450;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // The onboarding image
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    info.imagePath,
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitWidth,
                    height: imageHeight,
                  ),
                ),
              ),

              // The onboarding text
              Positioned(
                top: imageHeight - 50,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      info.title,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const Gap(8.0),
                    Text(
                      info.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              )
            ],
          ),

          // Bottom controls
          state is OnboardingStepState
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PageViewIndicatorWidget(
                      activePage: (state).index,
                      itemLength: onboardingSteps.length,
                    ),
                    FilledButton.tonalIcon(
                      onPressed: () {
                        ref
                            .read(onboardingProvider(onboardingSteps).notifier)
                            .nextStep();
                      },
                      label: const Text('Next'),
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 16.0,
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    PageViewIndicatorWidget(
                      itemLength: onboardingSteps.length,
                      activePage: onboardingSteps.length - 1,
                    ),
                    const Gap(8.0),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        child: const Text('Create an account'),
                        onPressed: () => goToSignUpPage(context),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.tonal(
                        onPressed: () => goToSignInPage(context),
                        child: const Text('Sign in'),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  void goToSignUpPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignUpPage(),
      ),
    );
  }

  void goToSignInPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignInPage(),
      ),
    );
  }
}
