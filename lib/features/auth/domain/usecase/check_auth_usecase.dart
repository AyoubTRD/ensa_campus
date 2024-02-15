import 'package:ensa_campus/features/auth/domain/common/auth_state.dart';
import 'package:ensa_campus/features/auth/domain/repositories/auth_repository.dart';
import 'package:ensa_campus/shared/common/interfaces/usecase.dart';

class CheckAuthUsecase extends Usecase<AuthState, void> {
  final AuthRepository repository;

  CheckAuthUsecase(this.repository);

  @override
  Future<AuthState> call(void params) async {
    return await repository.checkAuth();
  }
}
