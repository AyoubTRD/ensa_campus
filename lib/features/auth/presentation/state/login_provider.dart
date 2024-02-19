import 'package:ensa_campus/di/di.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_method.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_method_params.dart';
import 'package:ensa_campus/features/auth/domain/usecase/login_usecase.dart';
import 'package:ensa_campus/features/auth/presentation/state/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  @override
  Future<void> build() async {
    return;
  }

  Future<void> login<Method extends AuthMethod>(
    LoginAuthMethodParams<Method> params,
  ) async {
    state = const AsyncValue.loading();

    final response = await LoginUsecase<Method>(sl()).call(params);

    response.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (r) {
        ref.invalidate(authProvider);
        state = const AsyncValue.data(null);
      },
    );
  }
}
