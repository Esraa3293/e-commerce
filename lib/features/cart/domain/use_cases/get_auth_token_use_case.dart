import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/data/models/AuthToken.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_domain_repo.dart';

class GetAuthTokenUseCase {
  CartDomainRepo cartDomainRepo;

  GetAuthTokenUseCase(this.cartDomainRepo);

  Future<Either<Failures, AuthToken>> call(String apiKey) =>
      cartDomainRepo.getAuthToken(apiKey);
}
