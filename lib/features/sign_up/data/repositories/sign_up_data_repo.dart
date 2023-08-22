import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/sign_up/data/data_sources/data_sources.dart';
import 'package:e_commerce/features/sign_up/domain/entities/SignUpEntity.dart';
import 'package:e_commerce/features/sign_up/domain/entities/sign_up_data.dart';
import 'package:e_commerce/features/sign_up/domain/repositories/sign_up_domain_repo.dart';

class SignUpDataRepo implements SignUpDomainRepo {
  SignUpDataSource source;

  SignUpDataRepo(this.source);

  @override
  Future<Either<Failures, SignUpEntity>> signUp(SignUpData signUpData) =>
      source.signUp(signUpData);
}
