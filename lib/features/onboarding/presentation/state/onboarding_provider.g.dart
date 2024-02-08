// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$onboardingHash() => r'755373968bcbcc6a133676e5929ed227479186ea';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Onboarding
    extends BuildlessAutoDisposeNotifier<OnboardingState> {
  late final List<OnboardingStepEntity> onboardingSteps;

  OnboardingState build(
    List<OnboardingStepEntity> onboardingSteps,
  );
}

/// See also [Onboarding].
@ProviderFor(Onboarding)
const onboardingProvider = OnboardingFamily();

/// See also [Onboarding].
class OnboardingFamily extends Family<OnboardingState> {
  /// See also [Onboarding].
  const OnboardingFamily();

  /// See also [Onboarding].
  OnboardingProvider call(
    List<OnboardingStepEntity> onboardingSteps,
  ) {
    return OnboardingProvider(
      onboardingSteps,
    );
  }

  @override
  OnboardingProvider getProviderOverride(
    covariant OnboardingProvider provider,
  ) {
    return call(
      provider.onboardingSteps,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'onboardingProvider';
}

/// See also [Onboarding].
class OnboardingProvider
    extends AutoDisposeNotifierProviderImpl<Onboarding, OnboardingState> {
  /// See also [Onboarding].
  OnboardingProvider(
    List<OnboardingStepEntity> onboardingSteps,
  ) : this._internal(
          () => Onboarding()..onboardingSteps = onboardingSteps,
          from: onboardingProvider,
          name: r'onboardingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$onboardingHash,
          dependencies: OnboardingFamily._dependencies,
          allTransitiveDependencies:
              OnboardingFamily._allTransitiveDependencies,
          onboardingSteps: onboardingSteps,
        );

  OnboardingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.onboardingSteps,
  }) : super.internal();

  final List<OnboardingStepEntity> onboardingSteps;

  @override
  OnboardingState runNotifierBuild(
    covariant Onboarding notifier,
  ) {
    return notifier.build(
      onboardingSteps,
    );
  }

  @override
  Override overrideWith(Onboarding Function() create) {
    return ProviderOverride(
      origin: this,
      override: OnboardingProvider._internal(
        () => create()..onboardingSteps = onboardingSteps,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        onboardingSteps: onboardingSteps,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<Onboarding, OnboardingState>
      createElement() {
    return _OnboardingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OnboardingProvider &&
        other.onboardingSteps == onboardingSteps;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, onboardingSteps.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OnboardingRef on AutoDisposeNotifierProviderRef<OnboardingState> {
  /// The parameter `onboardingSteps` of this provider.
  List<OnboardingStepEntity> get onboardingSteps;
}

class _OnboardingProviderElement
    extends AutoDisposeNotifierProviderElement<Onboarding, OnboardingState>
    with OnboardingRef {
  _OnboardingProviderElement(super.provider);

  @override
  List<OnboardingStepEntity> get onboardingSteps =>
      (origin as OnboardingProvider).onboardingSteps;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
