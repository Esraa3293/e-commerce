import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/AddWishlistEntity.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';

class AddToWishlistUseCase {
  HomeDomainRepo homeDomainRepo;

  AddToWishlistUseCase(this.homeDomainRepo);

  Future<Either<Failures, AddWishlistEntity>> call(String productId) =>
      homeDomainRepo.addToWishlist(productId);
}
