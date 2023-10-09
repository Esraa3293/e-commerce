import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/data_sources/data_sources.dart';
import 'package:e_commerce/features/home/data/models/CartResponse.dart';
import 'package:e_commerce/features/home/data/models/CategoryOrBrandModel.dart';
import 'package:e_commerce/features/home/data/models/GetWishlistModel.dart';
import 'package:e_commerce/features/home/data/models/LoggedUserDataModel.dart';
import 'package:e_commerce/features/home/data/models/ProductModel.dart';
import 'package:e_commerce/features/home/data/models/RemoveWishlistModel.dart';
import 'package:e_commerce/features/home/data/models/WishlistModel.dart';

class HomeLocalDto implements HomeDataSources {
  @override
  Future<Either<Failures, CategoryOrBrandModel>> getBrands() {
    // TODO: implement getBrands
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, ProductModel>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CartResponse>> addToCart(String productId) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, WishlistModel>> addToWishlist(String productId) {
    // TODO: implement addToWishlist
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, GetWishlistModel>> getWishlist() {
    // TODO: implement getWishlist
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, RemoveWishlistModel>> deleteFromWishlist(String productId) {
    // TODO: implement deleteFromWishlist
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, LoggedUserDataModel>> getLoggedUser(String email, String password) {
    // TODO: implement getLoggedUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CategoryOrBrandModel>> search(String categoryId) {
    // TODO: implement search
    throw UnimplementedError();
  }

}