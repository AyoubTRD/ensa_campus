import 'package:ensa_campus/di/di.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_method.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_method_params.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_state.dart';
import 'package:ensa_campus/features/auth/domain/usecase/check_auth_usecase.dart';
import 'package:ensa_campus/features/auth/domain/usecase/login_usecase.dart';
import 'package:ensa_campus/features/auth/domain/usecase/logout_usecase.dart';
import 'package:ensa_campus/features/auth/domain/usecase/signup_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  AuthState build() {
    Future.delayed(Duration.zero, checkAuthState);

    return UndeterminedAuthState();
  }

  Future<AuthState> checkAuthState() async {
    final response = await CheckAuthUsecase(sl()).call(null);
    state = response;

    return state;
  }

  Future<AuthState> login<Method extends AuthMethod>(
      LoginAuthMethodParams<Method> params) async {
    final response = await LoginUsecase<Method>(sl()).call(params);
    state = response;

    return state;
  }

  Future<AuthState> signup<Method extends AuthMethod>(
      RegisterAuthMethodParams<Method> params) async {
    final response = await SignupUsecase<Method>(sl()).call(params);
    state = response;

    return state;
  }

  Future<AuthState> logout<Method extends AuthMethod>() async {
    final response = await LogoutUsecase(sl()).call(null);
    state = response;

    return state;
  }
}
