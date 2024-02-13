import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class InitialAuthState extends AuthState {
  @override
  List<Object?> get props => [];
}

class NotAuthenticatedState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthenticatedState extends AuthState {
  final String token;

  AuthenticatedState(this.token);

  @override
  List<Object?> get props => [token];
}

class UndeterminedAuthState extends AuthState {
  @override
  List<Object?> get props => [];
}
