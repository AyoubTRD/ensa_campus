import 'package:dartz/dartz.dart';
import 'package:ensa_campus/features/auth/domain/entities/user_entity.dart';
import 'package:ensa_campus/shared/common/error/failure.dart';

abstract class UserDataSource {
  Future<Either<Failure, UserEntity>> getLoggedInUser();
}
