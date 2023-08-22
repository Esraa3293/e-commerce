import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/login/data/models/SignInModel.dart';

abstract class SignInDataSource {
  Future<Either<Failures, SignInModel>> signIn(String email, String password);
}