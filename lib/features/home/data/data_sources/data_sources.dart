import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/models/CartResponse.dart';
import 'package:e_commerce/features/home/data/models/CategoryOrBrandModel.dart';
import 'package:e_commerce/features/home/data/models/ProductModel.dart';

abstract class HomeDataSources {
  Future<Either<Failures, CategoryOrBrandModel>> getBrands();

  Future<Either<Failures, CategoryOrBrandModel>> getCategories();

  Future<Either<Failures, ProductModel>> getProducts();

  Future<Either<Failures, CartResponse>> addToCart(String productId);
}
