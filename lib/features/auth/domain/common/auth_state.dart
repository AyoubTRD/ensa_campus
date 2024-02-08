import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class InitialAuthState extends AuthState {
  @override
  List<Object?> get props => [];
}

class NotAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  final String token;

  Authenticated(this.token);

  @override
  List<Object?> get props => [token];
}
