import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/data/models/GetCart.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_domain_repo.dart';

class RemoveCartItemUseCase {
  CartDomainRepo cartDomainRepo;

  RemoveCartItemUseCase(this.cartDomainRepo);

  Future<Either<Failures, GetCart>> call(String productId) =>
      cartDomainRepo.removeCartItem(productId);
}
