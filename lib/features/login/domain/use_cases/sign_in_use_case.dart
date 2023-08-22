import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/login/domain/entities/SignInEntity.dart';
import 'package:e_commerce/features/login/domain/repositories/sign_in_domain_repo.dart';

class SignInUseCase {
  SignInDomainRepo signInDomainRepo;

  SignInUseCase(this.signInDomainRepo);

  Future<Either<Failures, SignInEntity>> call(String email, String password) =>
      signInDomainRepo.signIn(email, password);
}
