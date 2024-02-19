import 'package:ensa_campus/di/di.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_method.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_method_params.dart';
import 'package:ensa_campus/features/auth/domain/usecase/signup_usecase.dart';
import 'package:ensa_campus/features/auth/presentation/state/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_provider.g.dart';

@riverpod
class Signup extends _$Signup {
  @override
  Future<void> build() async {
    return;
  }

  Future<void> signup<Method extends AuthMethod>(
      RegisterAuthMethodParams<Method> params) async {
    state = const AsyncValue.loading();

    final response = await SignupUsecase<Method>(sl()).call(params);

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
