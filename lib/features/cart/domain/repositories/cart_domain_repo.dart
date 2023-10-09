import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/data/models/AuthToken.dart';
import 'package:e_commerce/features/cart/data/models/GetCart.dart';

abstract class CartDomainRepo {
  Future<Either<Failures, GetCart>> getCart();

  Future<Either<Failures, GetCart>> removeCartItem(String productId);

  Future<Either<Failures, GetCart>> updateCart(String productId, int count);

  Future<Either<Failures, AuthToken>> getAuthToken(String apiKey);
}
