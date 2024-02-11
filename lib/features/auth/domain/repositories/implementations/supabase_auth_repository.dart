import 'package:ensa_campus/features/auth/domain/common/auth_method.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_method_params.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_state.dart';
import 'package:ensa_campus/features/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class SupabaseAuthRepository implements AuthRepository {
  final supabase.SupabaseClient client;

  SupabaseAuthRepository({required this.client});

  @override
  Future<AuthState> register<Method extends AuthMethod>(
      RegisterAuthMethodParams<Method> params) async {
    if (AuthMethod is ManualEntryAuthMethod) {
      final registerParams = params as RegisterManualEntryAuthParams;

      final response = await client.auth.signUp(
        email: registerParams.email,
        password: registerParams.password,
      );

      if (response.session == null) {
        return NotAuthenticatedState();
      } else {
        return AuthenticatedState(response.session!.accessToken);
      }
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<AuthState> login<Method extends AuthMethod>(
      LoginAuthMethodParams<Method> params) async {
    if (AuthMethod is ManualEntryAuthMethod) {
      final loginParams = params as LoginManualEntryAuthParams;

      final response = await client.auth.signInWithPassword(
        email: loginParams.email,
        password: loginParams.password,
      );

      if (response.session == null) {
        return NotAuthenticatedState();
      } else {
        return AuthenticatedState(response.session!.accessToken);
      }
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<AuthState> logout() async {
    await client.auth.signOut();

    return NotAuthenticatedState();
  }

  @override
  Future<AuthState> checkAuth() async {
    final session = client.auth.currentSession;

    if (session == null) {
      return NotAuthenticatedState();
    } else {
      return AuthenticatedState(session.accessToken);
    }
  }
}
