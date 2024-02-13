import 'package:ensa_campus/features/onboarding/domain/entities/onboarding_step_entity.dart';
import 'package:ensa_campus/features/onboarding/presentation/state/onboarding_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_provider.g.dart';

@riverpod
class Onboarding extends _$Onboarding {
  late List<OnboardingStepEntity> allOnboardingSteps;

  @override
  OnboardingState build(List<OnboardingStepEntity> onboardingSteps) {
    allOnboardingSteps = onboardingSteps;
    if (allOnboardingSteps.length == 1) {
      return OnboardingEndState(allOnboardingSteps.first);
    } else {
      return OnboardingStepState(0, allOnboardingSteps.first);
    }
  }

  void nextStep() {
    if (state is OnboardingEndState) {
      throw Exception('Onboarding is already finished');
    }

    final index = (state as OnboardingStepState).index;
    if (index == allOnboardingSteps.length - 2) {
      state = OnboardingEndState(allOnboardingSteps.last);
    } else {
      state = OnboardingStepState(index + 1, allOnboardingSteps[index + 1]);
    }
  }
}
