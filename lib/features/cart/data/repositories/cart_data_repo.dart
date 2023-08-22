import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/data/data_sources/data_source.dart';
import 'package:e_commerce/features/cart/data/models/GetCart.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_domain_repo.dart';

class CartDataRepo implements CartDomainRepo {
  CartDataSource cartDataSource;

  CartDataRepo(this.cartDataSource);

  @override
  Future<Either<Failures, GetCart>> getCart() {
    return cartDataSource.getCart();
  }

  @override
  Future<Either<Failures, GetCart>> removeCartItem(String productId) {
    return cartDataSource.removeCartItem(productId);
  }

  @override
  Future<Either<Failures, GetCart>> updateCart(String productId, int count) {
    return cartDataSource.updateCart(productId, count);
  }
}
