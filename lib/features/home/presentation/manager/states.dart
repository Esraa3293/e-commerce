import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/AddCartEntity.dart';
import 'package:e_commerce/features/home/domain/entities/AddWishlistEntity.dart';
import 'package:e_commerce/features/home/domain/entities/CategoryOrBrandEntity.dart';
import 'package:e_commerce/features/home/domain/entities/GetWishlistEntity.dart';
import 'package:e_commerce/features/home/domain/entities/LoggedUserDataEntity.dart';
import 'package:e_commerce/features/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce/features/home/domain/entities/RemoveWishlistEntity.dart';

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

class HomeAddWishlistLoadingState extends HomeStates {}

class HomeAddToWishlistSuccessState extends HomeStates {
  AddWishlistEntity addWishlistEntity;

  HomeAddToWishlistSuccessState(this.addWishlistEntity);
}

class HomeAddToWishlistErrorState extends HomeStates {
  Failures failures;

  HomeAddToWishlistErrorState(this.failures);
}

class HomeGetWishlistLoadingState extends HomeStates {}

class HomeGetWishlistSuccessState extends HomeStates {
  GetWishlistEntity getWishlistEntity;

  HomeGetWishlistSuccessState(this.getWishlistEntity);
}

class HomeGetWishlistErrorState extends HomeStates {
  Failures failures;

  HomeGetWishlistErrorState(this.failures);
}

class HomeRemoveFromWishlistLoadingState extends HomeStates {}

class HomeRemoveFromWishlistSuccessState extends HomeStates {
  RemoveWishlistEntity removeWishlistEntity;

  HomeRemoveFromWishlistSuccessState(this.removeWishlistEntity);
}

class HomeRemoveFromWishlistErrorState extends HomeStates {
  Failures failures;

  HomeRemoveFromWishlistErrorState(this.failures);
}

class HomeLoggedUserLoadingState extends HomeStates {}

class HomeLoggedUserSuccessState extends HomeStates {
  LoggedUserDataEntity loggedUserDataEntity;

  HomeLoggedUserSuccessState(this.loggedUserDataEntity);
}

class HomeLoggedUserErrorState extends HomeStates {
  Failures failures;

  HomeLoggedUserErrorState(this.failures);
}

class HomeSearchLoadingState extends HomeStates {}

class HomeSearchSuccessState extends HomeStates {
  CategoryOrBrandEntity categoryOrBrandEntity;

  HomeSearchSuccessState(this.categoryOrBrandEntity);
}

class HomeSearchErrorState extends HomeStates {
  Failures failures;

  HomeSearchErrorState(this.failures);
}
