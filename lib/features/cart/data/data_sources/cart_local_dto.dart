import 'package:dartz/dartz.dart';

import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/data/models/AuthToken.dart';
import 'package:e_commerce/features/cart/data/models/GetCart.dart';


import 'data_source.dart';

class CartLocalDto implements CartDataSource {
  @override
  Future<Either<Failures, GetCart>> getCart() {
    // TODO: implement getCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, GetCart>> removeCartItem(String productId) {
    // TODO: implement removeCartItem
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, GetCart>> updateCart(String productId, int count) {
    // TODO: implement updateCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, AuthToken>> getAuthToken(String apiKey) {
    // TODO: implement getAuthToken
    throw UnimplementedError();
  }

}