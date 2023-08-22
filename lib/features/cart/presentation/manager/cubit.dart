import 'package:e_commerce/features/cart/data/data_sources/cart_remote_dto.dart';
import 'package:e_commerce/features/cart/data/data_sources/data_source.dart';
import 'package:e_commerce/features/cart/data/models/GetCart.dart';
import 'package:e_commerce/features/cart/data/repositories/cart_data_repo.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_domain_repo.dart';
import 'package:e_commerce/features/cart/domain/use_cases/get_cart_use_case.dart';
import 'package:e_commerce/features/cart/domain/use_cases/remove_cart_item_use_case.dart';
import 'package:e_commerce/features/cart/domain/use_cases/update_cart_use_case.dart';
import 'package:e_commerce/features/cart/presentation/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartDataSource cartDataSource;
  late CartDomainRepo cartDomainRepo;
  Data? data;

  CartCubit(this.cartDataSource, {this.data}) : super(CartInitState()) {
    cartDomainRepo = CartDataRepo(cartDataSource);
  }

  //List<Products> cartProducts = [];

  static CartCubit get(context) => BlocProvider.of(context);

  void getCart() async {
    emit(CartLoadingState());
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var result = await cartUseCase.call();
    result.fold((l) {
      emit(CartErrorState(l));
    }, (r) {
      //cartProducts = r.data?.products ?? [];
      data = r.data;
      emit(CartSuccessState(r));
    });
  }

  void removeCartItem(String productId) async {
    //emit(RemoveCartItemLoadingState());
    RemoveCartItemUseCase removeCartItemUseCase =
        RemoveCartItemUseCase(cartDomainRepo);
    var result = await removeCartItemUseCase.call(productId);
    result.fold((l) {
      emit(RemoveCartItemErrorState(l));
    }, (r) {
      emit(CartSuccessState(r));
    });
  }

  void updateCart(String productId, int count) async {
    UpdateCartUseCase updateCartUseCase = UpdateCartUseCase(cartDomainRepo);
    var result = await updateCartUseCase.call(productId, count);
    result.fold((l) {
      emit(UpdateCartErrorState(l));
    }, (r) {
      emit(CartSuccessState(r));
    });
  }
}
