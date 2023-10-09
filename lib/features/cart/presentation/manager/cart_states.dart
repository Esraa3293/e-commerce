import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/data/models/GetCart.dart';

abstract class CartStates {}

class CartInitState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartSuccessState extends CartStates {
  GetCart getCart;

  CartSuccessState(this.getCart);
}

class CartErrorState extends CartStates {
  Failures failures;

  CartErrorState(this.failures);
}

class RemoveCartItemLoadingState extends CartStates {}

class RemoveCartItemSuccessState extends CartStates {
  GetCart getCart;

  RemoveCartItemSuccessState(this.getCart);
}

class RemoveCartItemErrorState extends CartStates {
  Failures failures;

  RemoveCartItemErrorState(this.failures);
}

class UpdateCartSuccessState extends CartStates {
  GetCart getCart;

  UpdateCartSuccessState(this.getCart);
}

class UpdateCartErrorState extends CartStates {
  Failures failures;

  UpdateCartErrorState(this.failures);
}
