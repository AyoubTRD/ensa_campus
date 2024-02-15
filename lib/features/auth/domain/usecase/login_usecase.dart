import 'package:ensa_campus/features/auth/domain/common/auth_method.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_method_params.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_state.dart';
import 'package:ensa_campus/features/auth/domain/repositories/auth_repository.dart';
import 'package:ensa_campus/shared/common/interfaces/usecase.dart';

class LoginUsecase<Method extends AuthMethod>
    extends Usecase<AuthState, LoginAuthMethodParams<Method>> {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<AuthState> call(LoginAuthMethodParams<Method> params) async {
    return await repository.login<Method>(params);
  }
}
