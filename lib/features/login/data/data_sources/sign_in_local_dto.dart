import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/login/data/data_sources/data_sources.dart';
import 'package:e_commerce/features/login/data/models/SignInModel.dart';

class SignInLocalDto implements SignInDataSource {
  @override
  Future<Either<Failures, SignInModel>> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

}