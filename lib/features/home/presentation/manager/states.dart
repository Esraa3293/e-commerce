import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/AddCartEntity.dart';
import 'package:e_commerce/features/home/domain/entities/CategoryOrBrandEntity.dart';
import 'package:e_commerce/features/home/domain/entities/ProductEntity.dart';

abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeGetCategoriesSuccessState extends HomeStates {
  CategoryOrBrandEntity categoryOrBrandEntity;

  HomeGetCategoriesSuccessState(this.categoryOrBrandEntity);
}

class HomeGetBrandsSuccessState extends HomeStates {
  CategoryOrBrandEntity categoryOrBrandEntity;

  HomeGetBrandsSuccessState(this.categoryOrBrandEntity);
}

class HomeGetCategoriesErrorState extends HomeStates {
  Failures failures;

  HomeGetCategoriesErrorState(this.failures);
}

class HomeGetBrandsErrorState extends HomeStates {
  Failures failures;

  HomeGetBrandsErrorState(this.failures);
}

class HomeGetProductsSuccessState extends HomeStates {
  ProductEntity productEntity;

  HomeGetProductsSuccessState(this.productEntity);
}

class HomeGetProductsErrorState extends HomeStates {
  Failures failures;

  HomeGetProductsErrorState(this.failures);
}

class HomeAddCartLoadingState extends HomeStates {}

class HomeAddToCartSuccessState extends HomeStates {
  AddCartEntity addCartEntity;

  HomeAddToCartSuccessState(this.addCartEntity);
}

class HomeAddToCartErrorState extends HomeStates {
  Failures failures;

  HomeAddToCartErrorState(this.failures);
}

class ChangeBottomNavBar extends HomeStates {}
