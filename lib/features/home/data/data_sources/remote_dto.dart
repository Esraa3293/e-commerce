import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/utils/cache_helper.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/features/home/data/data_sources/data_sources.dart';
import 'package:e_commerce/features/home/data/models/CartResponse.dart';
import 'package:e_commerce/features/home/data/models/CategoryOrBrandModel.dart';
import 'package:e_commerce/features/home/data/models/ProductModel.dart';

class HomeRemoteDto implements HomeDataSources {
  Dio dio = Dio();

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
    String userToken = CacheHelper.getData("User");
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
}
