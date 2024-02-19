import 'package:ensa_campus/shared/common/error/failure.dart';

class AuthFailure extends Failure {
  AuthFailure(super.message);
}

class LoginFailure extends AuthFailure {
  LoginFailure(super.message);
}

class RegisterFailure extends AuthFailure {
  RegisterFailure(super.message);
}
