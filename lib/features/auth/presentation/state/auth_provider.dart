import 'package:ensa_campus/di/di.dart';
import 'package:ensa_campus/features/auth/domain/common/auth_state.dart';
import 'package:ensa_campus/features/auth/domain/usecase/check_auth_usecase.dart';
import 'package:ensa_campus/features/shared/presentation/providers/logout_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  Future<AuthState> build() async {
    final response = await CheckAuthUsecase(sl()).call(null);

    return response.fold((l) {
      debugPrint('AuthStateProvider: $l');

      return NotAuthenticatedState();
    }, (r) => r);
  }
}
