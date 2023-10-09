import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/RemoveWishlistEntity.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';

class DeleteFromWishlistUseCase {
  HomeDomainRepo homeDomainRepo;

  DeleteFromWishlistUseCase(this.homeDomainRepo);

  Future<Either<Failures, RemoveWishlistEntity>> call(String productId) =>
      homeDomainRepo.deleteFromWishlist(productId);
}
