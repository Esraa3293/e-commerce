import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/data_sources/data_sources.dart';
import 'package:e_commerce/features/home/domain/entities/AddCartEntity.dart';
import 'package:e_commerce/features/home/domain/entities/CategoryOrBrandEntity.dart';
import 'package:e_commerce/features/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';

class HomeDataRepo implements HomeDomainRepo {
  HomeDataSources homeDataSources;

  HomeDataRepo(this.homeDataSources);

  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getCategories() {
    return homeDataSources.getCategories();
  }

  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getBrands() {
    return homeDataSources.getBrands();
  }

  @override
  Future<Either<Failures, ProductEntity>> getProducts() {
    return homeDataSources.getProducts();
  }

  @override
  Future<Either<Failures, AddCartEntity>> addToCart(String productId) {
    return homeDataSources.addToCart(productId);
  }
}
