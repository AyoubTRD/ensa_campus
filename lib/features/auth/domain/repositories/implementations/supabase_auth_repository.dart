import 'package:dartz/dartz.dart';
import 'package:ensa_campus/features/auth/domain/common/failures/auth_failures.dart';
import 'package:ensa_campus/shared/common/error/failure.dart';
import 'package:ensa_campus/features/auth/domain/common/adapters/supabase_user_adapter.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_method.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_method_params.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_state.dart';
import 'package:ensa_campus/features/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class SupabaseAuthRepository implements AuthRepository {
  final supabase.SupabaseClient client;

  SupabaseAuthRepository({required this.client});

  @override
  Future<Either<Failure, AuthState>> register<Method extends AuthMethod>(
      RegisterAuthMethodParams<Method> params) async {
    if (Method == ManualEntryAuthMethod) {
      final registerParams = params as RegisterManualEntryAuthParams;

      try {
        final response = await client.auth.signUp(
          email: registerParams.email,
          password: registerParams.password,
        );

        if (response.session == null) {
          return Left(RegisterFailure(
              'Could not create an account with the credentials provided'));
        } else {
          return Right(AuthenticatedState(
            response.session!.accessToken,
            SupabaseUserAdapter(response.session!.user),
          ));
        }
      } on supabase.AuthException catch (e) {
        return Left(RegisterFailure(e.message));
      } catch (e) {
        return Left(Failure('Unknown error occurred'));
      }
    } else {
      return Left(
        RegisterFailure('Unsupported auth method ${Method.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, AuthState>> login<Method extends AuthMethod>(
      LoginAuthMethodParams<Method> params) async {
    if (Method == ManualEntryAuthMethod) {
      final loginParams = params as LoginManualEntryAuthParams;

      try {
        final response = await client.auth.signInWithPassword(
          email: loginParams.email,
          password: loginParams.password,
        );

        if (response.session == null) {
          return Left(LoginFailure('Invalid credentials'));
        } else {
          return Right(AuthenticatedState(
            response.session!.accessToken,
            SupabaseUserAdapter(response.session!.user),
          ));
        }
      } on supabase.AuthException catch (e) {
        return Left(LoginFailure(e.message));
      } catch (e) {
        return Left(Failure('Unknown error occurred'));
      }
    } else {
      return Left(LoginFailure('Unsupported auth method ${Method.toString()}'));
    }
  }

  @override
  Future<Either<Failure, AuthState>> logout() async {
    await client.auth.signOut();

    return Right(NotAuthenticatedState());
  }

  @override
  Future<Either<Failure, AuthState>> checkAuth() async {
    final session = client.auth.currentSession;

    if (session == null) {
      return Right(NotAuthenticatedState());
    } else {
      if (session.isExpired) {
        try {
          await client.auth.refreshSession();
        } on supabase.AuthException catch (e) {
          return Left(AuthFailure(e.message));
        }
      }

      return Right(
        AuthenticatedState(
          session.accessToken,
          SupabaseUserAdapter(session.user),
        ),
      );
    }
  }
}
