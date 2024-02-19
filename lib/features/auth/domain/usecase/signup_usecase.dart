import 'package:dartz/dartz.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_method.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_method_params.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_state.dart';
import 'package:ensa_campus/features/auth/domain/repositories/auth_repository.dart';
import 'package:ensa_campus/shared/common/error/failure.dart';
import 'package:ensa_campus/shared/common/interfaces/usecase.dart';

class SignupUsecase<Method extends AuthMethod> extends Usecase<
    Either<Failure, AuthState>, RegisterAuthMethodParams<Method>> {
  final AuthRepository repository;

  SignupUsecase(this.repository);

  @override
  Future<Either<Failure, AuthState>> call(
      RegisterAuthMethodParams<Method> params) async {
    return await repository.register<Method>(params);
  }
}
