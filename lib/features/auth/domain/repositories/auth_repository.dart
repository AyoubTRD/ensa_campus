import 'package:ensa_campus/features/auth/domain/common/auth_method.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_method_params.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_state.dart';

abstract class AuthRepository {
  Future<AuthState> login<Method extends AuthMethod>(
      LoginAuthMethodParams<Method> params);

  Future<AuthState> register<Method extends AuthMethod>(
      RegisterAuthMethodParams<Method> params);

  Future<AuthState> logout();
  Future<AuthState> checkAuth();
}
