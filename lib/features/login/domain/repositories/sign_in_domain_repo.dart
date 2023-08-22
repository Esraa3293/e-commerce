import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/login/domain/entities/SignInEntity.dart';

abstract class SignInDomainRepo {
  Future<Either<Failures, SignInEntity>> signIn(String email, String password);
}
