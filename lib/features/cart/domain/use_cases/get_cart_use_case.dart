import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/data/models/GetCart.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_domain_repo.dart';

class CartUseCase {
 CartDomainRepo cartDomainRepo;

 CartUseCase(this.cartDomainRepo);

  Future<Either<Failures,GetCart>> call() => cartDomainRepo.getCart();
}