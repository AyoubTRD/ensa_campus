import 'package:ensa_campus/features/auth/domain/common/auth_state.dart';

abstract class AuthRepository {
  Future<AuthState> login(String email, String password);
  Future<AuthState> register(String email, String password, String name);
  Future<AuthState> logout();
  Future<AuthState> checkAuth();
}
