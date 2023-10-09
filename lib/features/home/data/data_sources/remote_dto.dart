import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/utils/cache_helper.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/features/home/data/data_sources/data_sources.dart';
import 'package:e_commerce/features/home/data/models/CartResponse.dart';
import 'package:e_commerce/features/home/data/models/CategoryOrBrandModel.dart';
import 'package:e_commerce/features/home/data/models/GetWishlistModel.dart';
import 'package:e_commerce/features/home/data/models/LoggedUserDataModel.dart';
import 'package:e_commerce/features/home/data/models/ProductModel.dart';
import 'package:e_commerce/features/home/data/models/RemoveWishlistModel.dart';
import 'package:e_commerce/features/home/data/models/WishlistModel.dart';

class HomeRemoteDto implements HomeDataSources {
  Dio dio = Dio();
  String userToken = CacheHelper.getData("User");

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getBrands() async {
    try {
      var response =
          await dio.get("${Constants.baseUrlApi}${EndPoints.getAllBrands}");
      CategoryOrBrandModel categoryOrBrandModel =
          CategoryOrBrandModel.fromJson(response.data);
      return Right(categoryOrBrandModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getCategories() async {
    try {
      var response =
          await dio.get("${Constants.baseUrlApi}${EndPoints.getAllCategories}");
      CategoryOrBrandModel categoryOrBrandModel =
          CategoryOrBrandModel.fromJson(response.data);
      return Right(categoryOrBrandModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductModel>> getProducts() async {
    try {
      var response =
          await dio.get("${Constants.baseUrlApi}${EndPoints.getAllProducts}");
      ProductModel productModel = ProductModel.fromJson(response.data);
      return Right(productModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartResponse>> addToCart(String productId) async {
    try {
      var response = await dio.post(
          "${Constants.baseUrlApi}${EndPoints.addProductToCart}",
          options: Options(headers: {"token": userToken}),
          data: {"productId": productId});
      CartResponse cartResponse = CartResponse.fromJson(response.data);
      return Right(cartResponse);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, WishlistModel>> addToWishlist(
      String productId) async {
    try {
      var response = await dio.post(
          "${Constants.baseUrlApi}${EndPoints.addProductToWishlist}",
          options: Options(headers: {"token": userToken}),
          data: {"productId": productId});
      WishlistModel wishlistModel = WishlistModel.fromJson(response.data);
      return Right(wishlistModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetWishlistModel>> getWishlist() async {
    try {
      var response = await dio.get(
          "${Constants.baseUrlApi}${EndPoints.addProductToWishlist}",
          options: Options(headers: {"token": userToken}));
      GetWishlistModel getWishlistModel =
          GetWishlistModel.fromJson(response.data);
      return Right(getWishlistModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, RemoveWishlistModel>> deleteFromWishlist(
      String productId) async {
    try {
      var response = await dio.delete(
        "${Constants.baseUrlApi}${EndPoints.addProductToWishlist}/$productId",
        options: Options(headers: {"token": userToken}),
      );
      RemoveWishlistModel removeWishlistModel =
          RemoveWishlistModel.fromJson(response.data);
      return Right(removeWishlistModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, LoggedUserDataModel>> getLoggedUser(
      String email, String password) async {
    try {
      var response = await dio.post("${Constants.baseUrlApi}${EndPoints.login}",
          data: {"email": email, "password": password});
      LoggedUserDataModel loggedUserDataModel =
          LoggedUserDataModel.fromJson(response.data);
      return Right(loggedUserDataModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandModel>> search(
      String categoryId) async {
    try {
      var response = await dio.get(
        "${Constants.baseUrlApi}${EndPoints.getAllCategories}/$categoryId",
      );
      CategoryOrBrandModel categoryOrBrandModel =
          CategoryOrBrandModel.fromJson(response.data);

      return Right(categoryOrBrandModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
