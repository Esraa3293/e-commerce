import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/AddCartEntity.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';

class AddCartUseCase {
  HomeDomainRepo homeDomainRepo;

  AddCartUseCase(this.homeDomainRepo);

  Future<Either<Failures, AddCartEntity>> call(String productId) => homeDomainRepo.addToCart(productId);
}
