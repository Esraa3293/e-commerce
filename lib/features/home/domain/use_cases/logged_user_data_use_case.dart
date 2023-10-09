import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/LoggedUserDataEntity.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';

class LoggedUserDataUseCase {
  HomeDomainRepo homeDomainRepo;

  LoggedUserDataUseCase(this.homeDomainRepo);

  Future<Either<Failures, LoggedUserDataEntity>> call(String email, String password) =>
      homeDomainRepo.getLoggedUser(email, password);
}
