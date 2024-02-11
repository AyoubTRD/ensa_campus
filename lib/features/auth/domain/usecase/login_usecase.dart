import 'package:ensa_campus/features/auth/domain/common/auth_method.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_method_params.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_state.dart';
import 'package:ensa_campus/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase<Method extends AuthMethod> {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  Future<AuthState> call(LoginAuthMethodParams<Method> params) async {
    return await repository.login<Method>(params);
  }
}
