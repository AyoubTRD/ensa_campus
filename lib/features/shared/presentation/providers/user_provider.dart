import 'package:ensa_campus/di/di.dart';
import 'package:ensa_campus/features/auth/domain/entities/user_entity.dart';
import 'package:ensa_campus/features/shared/domain/usecases/get_user_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
class User extends _$User {
  @override
  Future<UserEntity> build() async {
    final response = await GetUserUsecase(sl()).call(null);

    return response.fold((l) {
      throw l;
    }, (r) => r);
  }
}
