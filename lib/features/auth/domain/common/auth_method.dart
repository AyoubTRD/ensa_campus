import 'package:equatable/equatable.dart';

abstract class AuthMethod extends Equatable {}

class GoogleAuthMethod extends AuthMethod {
  @override
  List<Object> get props => [];
}

class AppleAuthMethod extends AuthMethod {
  @override
  List<Object> get props => [];
}

class ManualEntryAuthMethod extends AuthMethod {
  @override
  List<Object> get props => [];
}
