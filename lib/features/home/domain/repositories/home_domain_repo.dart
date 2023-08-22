import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/AddCartEntity.dart';
import 'package:e_commerce/features/home/domain/entities/CategoryOrBrandEntity.dart';
import 'package:e_commerce/features/home/domain/entities/ProductEntity.dart';

abstract class HomeDomainRepo {
  Future<Either<Failures, CategoryOrBrandEntity>> getCategories();

  Future<Either<Failures, CategoryOrBrandEntity>> getBrands();

  Future<Either<Failures, ProductEntity>> getProducts();

  Future<Either<Failures, AddCartEntity>> addToCart(String productId);
}
