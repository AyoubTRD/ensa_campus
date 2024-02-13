// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authHash() => r'd92a50de9b7243163f2969d1ba6bcd3af15cccf0';

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

abstract class _$Auth extends BuildlessAutoDisposeNotifier<AuthState> {
  late final AuthRepository authRepository;

  AuthState build(
    AuthRepository authRepository,
  );
}

/// See also [Auth].
@ProviderFor(Auth)
const authProvider = AuthFamily();

/// See also [Auth].
class AuthFamily extends Family<AuthState> {
  /// See also [Auth].
  const AuthFamily();

  /// See also [Auth].
  AuthProvider call(
    AuthRepository authRepository,
  ) {
    return AuthProvider(
      authRepository,
    );
  }

  @override
  AuthProvider getProviderOverride(
    covariant AuthProvider provider,
  ) {
    return call(
      provider.authRepository,
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
  String? get name => r'authProvider';
}

/// See also [Auth].
class AuthProvider extends AutoDisposeNotifierProviderImpl<Auth, AuthState> {
  /// See also [Auth].
  AuthProvider(
    AuthRepository authRepository,
  ) : this._internal(
          () => Auth()..authRepository = authRepository,
          from: authProvider,
          name: r'authProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$authHash,
          dependencies: AuthFamily._dependencies,
          allTransitiveDependencies: AuthFamily._allTransitiveDependencies,
          authRepository: authRepository,
        );

  AuthProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.authRepository,
  }) : super.internal();

  final AuthRepository authRepository;

  @override
  AuthState runNotifierBuild(
    covariant Auth notifier,
  ) {
    return notifier.build(
      authRepository,
    );
  }

  @override
  Override overrideWith(Auth Function() create) {
    return ProviderOverride(
      origin: this,
      override: AuthProvider._internal(
        () => create()..authRepository = authRepository,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        authRepository: authRepository,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<Auth, AuthState> createElement() {
    return _AuthProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AuthProvider && other.authRepository == authRepository;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, authRepository.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AuthRef on AutoDisposeNotifierProviderRef<AuthState> {
  /// The parameter `authRepository` of this provider.
  AuthRepository get authRepository;
}

class _AuthProviderElement
    extends AutoDisposeNotifierProviderElement<Auth, AuthState> with AuthRef {
  _AuthProviderElement(super.provider);

  @override
  AuthRepository get authRepository => (origin as AuthProvider).authRepository;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
