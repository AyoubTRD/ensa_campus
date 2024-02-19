import 'package:ensa_campus/di/di.dart';
import 'package:ensa_campus/features/auth/domain/usecase/logout_usecase.dart';
import 'package:ensa_campus/features/auth/presentation/state/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_provider.g.dart';

@riverpod
class Logout extends _$Logout {
  @override
  Future<void> build() async {
    return;
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();

    final response = await LogoutUsecase(sl()).call(null);
    response.fold(
      (l) {
        state = AsyncValue.error(l, StackTrace.current);
      },
      (r) {
        state = const AsyncValue.data(null);
        ref.read(authProvider.notifier).state = AsyncValue.data(r);
      },
    );
  }
}
