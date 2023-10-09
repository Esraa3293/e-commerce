import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/GetWishlistEntity.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';

class GetWishlistUseCase {
  HomeDomainRepo homeDomainRepo;

  GetWishlistUseCase(this.homeDomainRepo);

  Future<Either<Failures, GetWishlistEntity>> call() =>
      homeDomainRepo.getWishlist();
}
