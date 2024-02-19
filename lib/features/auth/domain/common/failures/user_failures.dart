import 'package:ensa_campus/shared/common/error/failure.dart';

class UserFailure extends Failure {
  UserFailure(super.message);
}

class UnauthenticatedUserFailure extends UserFailure {
  UnauthenticatedUserFailure(super.message);
}
