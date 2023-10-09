import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/AddCartEntity.dart';
import 'package:e_commerce/features/home/domain/entities/AddWishlistEntity.dart';
import 'package:e_commerce/features/home/domain/entities/CategoryOrBrandEntity.dart';
import 'package:e_commerce/features/home/domain/entities/GetWishlistEntity.dart';
import 'package:e_commerce/features/home/domain/entities/LoggedUserDataEntity.dart';
import 'package:e_commerce/features/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce/features/home/domain/entities/RemoveWishlistEntity.dart';

abstract class HomeDomainRepo {
  Future<Either<Failures, CategoryOrBrandEntity>> getCategories();

  Future<Either<Failures, CategoryOrBrandEntity>> getBrands();

  Future<Either<Failures, ProductEntity>> getProducts();

  Future<Either<Failures, AddCartEntity>> addToCart(String productId);

  Future<Either<Failures, AddWishlistEntity>> addToWishlist(String productId);

  Future<Either<Failures, GetWishlistEntity>> getWishlist();

  Future<Either<Failures, RemoveWishlistEntity>> deleteFromWishlist(String productId);

  Future<Either<Failures, LoggedUserDataEntity>> getLoggedUser(String email, String password);

  Future<Either<Failures, CategoryOrBrandEntity>> search(String categoryId);
}
