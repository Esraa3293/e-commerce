import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/features/home/data/data_sources/data_sources.dart';
import 'package:e_commerce/features/home/data/repositories/home_data_repo.dart';
import 'package:e_commerce/features/home/domain/entities/CategoryOrBrandEntity.dart';
import 'package:e_commerce/features/home/domain/entities/GetWishlistEntity.dart';
import 'package:e_commerce/features/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';
import 'package:e_commerce/features/home/domain/use_cases/add_cart_use_case.dart';
import 'package:e_commerce/features/home/domain/use_cases/add_to_wishlist_use_case.dart';
import 'package:e_commerce/features/home/domain/use_cases/delete_from_wishlist_use_case.dart';
import 'package:e_commerce/features/home/domain/use_cases/get_brands_use_case.dart';
import 'package:e_commerce/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:e_commerce/features/home/domain/use_cases/get_products_use_case.dart';
import 'package:e_commerce/features/home/domain/use_cases/get_wishlist_use_case.dart';
import 'package:e_commerce/features/home/domain/use_cases/logged_user_data_use_case.dart';
import 'package:e_commerce/features/home/domain/use_cases/search_use_case.dart';
import 'package:e_commerce/features/home/presentation/manager/states.dart';
import 'package:e_commerce/features/home/presentation/pages/tabs/category_tab.dart';
import 'package:e_commerce/features/home/presentation/pages/tabs/home_tab.dart';
import 'package:e_commerce/features/home/presentation/pages/tabs/fav_tab.dart';
import 'package:e_commerce/features/home/presentation/pages/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeDataSources homeDataSources;
  late HomeDomainRepo homeDomainRepo;

  HomeCubit(this.homeDataSources) : super(HomeInitState()) {
    homeDomainRepo = HomeDataRepo(homeDataSources);
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  int bottomNavIndex = 0;
  num cartItems = 0;
  int favoriteItems = 0;

  List<Widget> tabs = const [HomeTab(), CategoryTab(), FavTab(), ProfileTab()];

  List<String> slider = [
    AppImages.slider1,
    AppImages.slider2,
    AppImages.slider3
  ];

  List<DataEntity> categories = [];
  List<DataWishlist> favorites = [];
  List<String> categoryNames = [
    "Music",
    "Men's Fashion",
    "Women's Fashion",
    "SuperMarket",
    "Baby & Toys",
    "Home",
    "Books",
    "Beauty & Health",
    "Mobiles",
    "Electronics"
  ];
  List<DataEntity> filteredCategories = [];
  String selectedProductCategory = "Music";

  List<DataEntity> brands = [];

  List<ProductDataEntity> products = [];

  void changeBottomNav(int index) {
    emit(HomeInitState());
    bottomNavIndex = index;
    emit(ChangeBottomNavBar());
  }

  getCategories() async {
    emit(HomeLoadingState());

    GetCategoriesUseCase getCategoriesUseCase =
        GetCategoriesUseCase(homeDomainRepo);
    var result = await getCategoriesUseCase.call();
    result.fold((l) {
      emit(HomeGetCategoriesErrorState(l));
    }, (r) {
      categories = r.data ?? [];
      emit(HomeGetCategoriesSuccessState(r));
    });
  }

  getBrands() async {
    emit(HomeLoadingState());

    GetBrandsUseCase getBrandsUseCase = GetBrandsUseCase(homeDomainRepo);
    var result = await getBrandsUseCase.call();
    result.fold((l) {
      emit(HomeGetBrandsErrorState(l));
    }, (r) {
      brands = r.data ?? [];
      emit(HomeGetBrandsSuccessState(r));
    });
  }

  getProducts() async {
    emit(HomeLoadingState());
    GetProductsUseCase getProductsUseCase = GetProductsUseCase(homeDomainRepo);
    var result = await getProductsUseCase.call();
    result.fold((l) {
      emit(HomeGetProductsErrorState(l));
    }, (r) {
      products = r.data ?? [];
      emit(HomeGetProductsSuccessState(r));
    });
  }

  void addToCart(String productId) async {
    emit(HomeAddCartLoadingState());
    AddCartUseCase addCartUseCase = AddCartUseCase(homeDomainRepo);
    var result = await addCartUseCase.call(productId);
    result.fold((l) {
      emit(HomeAddToCartErrorState(l));
    }, (r) {
      cartItems = r.numOfCartItems ?? 0;
      emit(HomeAddToCartSuccessState(r));
    });
  }

  void addToWishlist(String productId) async {
    emit(HomeAddWishlistLoadingState());
    AddToWishlistUseCase addToWishlistUseCase =
        AddToWishlistUseCase(homeDomainRepo);
    var result = await addToWishlistUseCase.call(productId);
    result.fold((l) {
      emit(HomeAddToWishlistErrorState(l));
    }, (r) {
      favoriteItems = r.data?.length ?? 0;
      emit(HomeAddToWishlistSuccessState(r));
    });
  }

  void getWishlist() async {
    emit(HomeGetWishlistLoadingState());
    GetWishlistUseCase getWishlistUseCase = GetWishlistUseCase(homeDomainRepo);
    var result = await getWishlistUseCase.call();
    result.fold((l) {
      print(l);
      emit(HomeGetWishlistErrorState(l));
    }, (r) {
      favorites = r.data ?? [];
      emit(HomeGetWishlistSuccessState(r));
    });
  }

  void deleteFromWishlist(String productId) async {
    emit(HomeRemoveFromWishlistLoadingState());
    DeleteFromWishlistUseCase deleteFromWishlistUseCase =
        DeleteFromWishlistUseCase(homeDomainRepo);
    var result = await deleteFromWishlistUseCase.call(productId);
    result.fold((l) {
      print(l);
      emit(HomeRemoveFromWishlistErrorState(l));
    }, (r) {
      emit(HomeRemoveFromWishlistSuccessState(r));
    });
  }

  void getLoggedUserData(String email, String password) async {
    emit(HomeLoggedUserLoadingState());
    LoggedUserDataUseCase loggedUserDataUseCase =
        LoggedUserDataUseCase(homeDomainRepo);
    var result = await loggedUserDataUseCase.call(email, password);
    result.fold((l) {
      emit(HomeLoggedUserErrorState(l));
    }, (r) {
      emit(HomeLoggedUserSuccessState(r));
    });
  }

  void searchCategory(String categoryId) async{
    emit(HomeSearchLoadingState());
    SearchUseCase searchUseCase = SearchUseCase(homeDomainRepo);
    var result = await searchUseCase.call(categoryId);
    result.fold((l) {
      emit(HomeSearchErrorState(l));
    }, (r) {
      emit(HomeSearchSuccessState(r));
    });
  }
}
