import 'package:dartz/dartz.dart';
import 'package:ensa_campus/features/auth/domain/common/adapters/supabase_user_adapter.dart';
import 'package:ensa_campus/features/auth/domain/common/failures/user_failures.dart';
import 'package:ensa_campus/features/auth/domain/entities/user_entity.dart';
import 'package:ensa_campus/features/shared/data/user_data_source.dart';
import 'package:ensa_campus/shared/common/error/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseUserDataSource implements UserDataSource {
  final SupabaseClient _client;

  SupabaseUserDataSource(this._client);

  @override
  Future<Either<Failure, UserEntity>> getLoggedInUser() async {
    final response = await _client.auth.getUser();

    if (response.user != null) {
      return Right(SupabaseUserAdapter(response.user!));
    }
    return Left(UnauthenticatedUserFailure('User is not authenticated.'));
  }
}
