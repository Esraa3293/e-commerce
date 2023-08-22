import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/login/data/data_sources/data_sources.dart';
import 'package:e_commerce/features/login/domain/entities/SignInEntity.dart';
import 'package:e_commerce/features/login/domain/repositories/sign_in_domain_repo.dart';

class SignInDataRepo implements SignInDomainRepo {
  SignInDataSource source;

  SignInDataRepo(this.source);

  @override
  Future<Either<Failures, SignInEntity>> signIn(
          String email, String password) =>
      source.signIn(email, password);
}
