import 'package:dartz/dartz.dart';
import 'package:ensa_campus/shared/common/error/failure.dart';
import 'package:ensa_campus/shared/common/interfaces/usecase.dart';

abstract class LogoutUsecase extends Usecase<Either<Failure, void>, void> {}
