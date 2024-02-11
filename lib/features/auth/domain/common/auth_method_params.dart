import 'package:ensa_campus/features/auth/domain/common/auth_method.dart';

abstract class AuthMethodParams<Method extends AuthMethod> {}

abstract class RegisterAuthMethodParams<Method extends AuthMethod>
    extends AuthMethodParams<Method> {}

abstract class LoginAuthMethodParams<Method extends AuthMethod>
    extends AuthMethodParams<Method> {}

// Register params
class RegisterManualEntryAuthParams
    extends RegisterAuthMethodParams<ManualEntryAuthMethod> {
  final String email;
  final String password;

  RegisterManualEntryAuthParams({required this.email, required this.password});
}

class RegisterGoogleAuthParams
    extends RegisterAuthMethodParams<GoogleAuthMethod> {}

class RegisterAppleAuthParams
    extends RegisterAuthMethodParams<AppleAuthMethod> {}

// Login params
class LoginManualEntryAuthParams
    extends LoginAuthMethodParams<ManualEntryAuthMethod> {
  final String email;
  final String password;

  LoginManualEntryAuthParams({required this.email, required this.password});
}

class LoginGoogleAuthParams extends LoginAuthMethodParams<GoogleAuthMethod> {}

class LoginAppleAuthParams extends LoginAuthMethodParams<AppleAuthMethod> {}
