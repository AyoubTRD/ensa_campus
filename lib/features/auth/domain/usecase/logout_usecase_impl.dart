import 'package:dartz/dartz.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_state.dart';
import 'package:ensa_campus/features/auth/domain/repositories/auth_repository.dart';
import 'package:ensa_campus/features/shared/domain/usecases/logout_usecase.dart';
import 'package:ensa_campus/shared/common/error/failure.dart';

class LogoutUsecaseImpl extends LogoutUsecase {
  final AuthRepository repository;

  LogoutUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, AuthState>> call(void params) async {
    return await repository.logout();
  }
}
