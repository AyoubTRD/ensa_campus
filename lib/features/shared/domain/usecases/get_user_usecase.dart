import 'package:dartz/dartz.dart';
import 'package:ensa_campus/features/auth/domain/entities/user_entity.dart';
import 'package:ensa_campus/features/shared/data/user_data_source.dart';
import 'package:ensa_campus/shared/common/error/failure.dart';
import 'package:ensa_campus/shared/common/interfaces/usecase.dart';

class GetUserUsecase extends Usecase<Either<Failure, UserEntity>, void> {
  final UserDataSource _userDataSource;

  GetUserUsecase(this._userDataSource);

  @override
  Future<Either<Failure, UserEntity>> call(void params) {
    return _userDataSource.getLoggedInUser();
  }
}
