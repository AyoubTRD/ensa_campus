import 'package:ensa_campus/features/onboarding/presentation/state/onboarding_provider.dart';
import 'package:ensa_campus/features/onboarding/presentation/state/onboarding_steps.dart';
import 'package:ensa_campus/features/onboarding/presentation/widgets/onbaording_step_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingStepsPage extends ConsumerWidget {
  final PageController _pageController = PageController();

  OnboardingStepsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(OnboardingProvider(onboardingSteps), (previous, next) {
      if (previous == null) return;

      final int nextPageIndex = _pageController.page!.toInt() + 1;
      _pageController.animateToPage(nextPageIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.linearToEaseOut);
    });

    return Scaffold(
      appBar: AppBar(
        title: const FlutterLogo(size: 48),
        centerTitle: true,
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: onboardingSteps
              .map(
                (e) => OnboardingStepWidget(e),
              )
              .toList(),
        ),
      ),
    );
  }
}
