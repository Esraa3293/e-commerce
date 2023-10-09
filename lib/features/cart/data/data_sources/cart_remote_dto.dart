import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/utils/cache_helper.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/features/cart/data/data_sources/data_source.dart';
import 'package:e_commerce/features/cart/data/models/AuthToken.dart';
import 'package:e_commerce/features/cart/data/models/GetCart.dart';

class CartRemoteDto implements CartDataSource {
  Dio dio = Dio();
  var token = CacheHelper.getData("User");

  @override
  Future<Either<Failures, GetCart>> getCart() async {
    try {
      var response = await dio.get(
          "${Constants.baseUrlApi}${EndPoints.addProductToCart}",
          options: Options(headers: {"token": token}));
      GetCart getCart = GetCart.fromJson(response.data);
      return Right(getCart);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetCart>> removeCartItem(String productId) async {
    try {
      var response = await dio.delete(
          "${Constants.baseUrlApi}${EndPoints.addProductToCart}/$productId",
          options: Options(headers: {"token": token}));
      GetCart getCart = GetCart.fromJson(response.data);
      return Right(getCart);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetCart>> updateCart(
      String productId, int count) async {
    try {
      var response = await dio.put(
          "${Constants.baseUrlApi}${EndPoints.addProductToCart}/$productId",
          options: Options(headers: {"token": token}),
          data: {"count": count});
      GetCart getCart = GetCart.fromJson(response.data);
      return Right(getCart);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, AuthToken>> getAuthToken(String apiKey) async {
    try {
      var response = await dio.post(
          "${Constants.paymentBaseUrlApi}${EndPoints.authToken}",
          data: {"api_key": Constants.apiKey});
      AuthToken authToken = AuthToken.fromJson(response.data);
      return Right(authToken);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
