import 'package:ensa_campus/features/onboarding/domain/entities/onboarding_step_entity.dart';
import 'package:equatable/equatable.dart';

abstract class OnboardingState extends Equatable {}

class OnboardingStepState extends OnboardingState {
  final int index;
  final OnboardingStepEntity step;

  OnboardingStepState(this.index, this.step);

  @override
  List<Object?> get props => [step, index];
}

class OnboardingEndState extends OnboardingState {
  final OnboardingStepEntity step;

  OnboardingEndState(this.step);

  @override
  List<Object?> get props => [step];
}
