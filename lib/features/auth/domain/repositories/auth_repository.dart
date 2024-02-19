import 'package:dartz/dartz.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_method.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_method_params.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_state.dart';
import 'package:ensa_campus/shared/common/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthState>> login<Method extends AuthMethod>(
      LoginAuthMethodParams<Method> params);

  Future<Either<Failure, AuthState>> register<Method extends AuthMethod>(
      RegisterAuthMethodParams<Method> params);

  Future<Either<Failure, AuthState>> logout();

  Future<Either<Failure, AuthState>> checkAuth();
}
