import 'package:ensa_campus/features/auth/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class InitialAuthState extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoadingAuthState extends AuthState {
  @override
  List<Object?> get props => [];
}

class NotAuthenticatedState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthenticatedState extends AuthState {
  final String token;
  final UserEntity user;

  AuthenticatedState(this.token, this.user);

  @override
  List<Object?> get props => [token, user];
}

class UndeterminedAuthState extends AuthState {
  @override
  List<Object?> get props => [];
}
