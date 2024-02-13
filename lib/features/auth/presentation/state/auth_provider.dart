import 'package:ensa_campus/features/auth/domain/common/auth_state.dart';
import 'package:ensa_campus/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  late final AuthRepository _authRepository;

  @override
  AuthState build(AuthRepository authRepository) {
    _authRepository = authRepository;
    checkAuthState();

    return UndeterminedAuthState();
  }

  Future<void> checkAuthState() async {
    final response = await _authRepository.checkAuth();
    state = response;
  }
}
