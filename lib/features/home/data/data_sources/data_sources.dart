import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/models/CartResponse.dart';
import 'package:e_commerce/features/home/data/models/CategoryOrBrandModel.dart';
import 'package:e_commerce/features/home/data/models/GetWishlistModel.dart';
import 'package:e_commerce/features/home/data/models/LoggedUserDataModel.dart';
import 'package:e_commerce/features/home/data/models/ProductModel.dart';
import 'package:e_commerce/features/home/data/models/RemoveWishlistModel.dart';
import 'package:e_commerce/features/home/data/models/WishlistModel.dart';

abstract class HomeDataSources {
  Future<Either<Failures, CategoryOrBrandModel>> getBrands();

  Future<Either<Failures, CategoryOrBrandModel>> getCategories();

  Future<Either<Failures, ProductModel>> getProducts();

  Future<Either<Failures, CartResponse>> addToCart(String productId);

  Future<Either<Failures, WishlistModel>> addToWishlist(String productId);

  Future<Either<Failures, GetWishlistModel>> getWishlist();

  Future<Either<Failures, RemoveWishlistModel>> deleteFromWishlist(String productId);

  Future<Either<Failures, LoggedUserDataModel>> getLoggedUser(String email, String password);

  Future<Either<Failures, CategoryOrBrandModel>> search(String categoryId);
}
