import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/network/dio_helper.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/features/cart/presentation/manager/payment_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitState());

  static PaymentCubit get(context) => BlocProvider.of(context);

  void getAuthToken() {
    emit(AuthTokenLoadingState());
    DioHelper.postData(
        endPoint: EndPoints.authToken,
        data: {"api_key": Constants.apiKey}).then((value) {
      Constants.Auth_Token = value.data["token"];
      getOrderId();
      print(Constants.Auth_Token);
      emit(AuthTokenSuccessState());
    }).catchError((error) {
      emit(AuthTokenErrorState());
    });
  }

  void getOrderId() {
    emit(OrderIdLoadingState());
    DioHelper.postData(endPoint: EndPoints.orderId, data: {
      "auth_token": Constants.Auth_Token,
      "delivery_needed": "false",
      "amount_cents": "10000",
      "currency": "EGP",
      "items": []
    }).then((value) {
      Constants.Order_Id = value.data["id"].toString();
      getRequestTokenCard();
      getRequestTokenKiosk();
      emit(OrderIdSuccessState());
      print(Constants.Order_Id);
    }).catchError((error) {
      emit(OrderIdErrorState());
    });
  }

  void getRequestTokenCard() {
    emit(RequestTokenCardLoadingState());
    DioHelper.postData(endPoint: EndPoints.requestToken, data: {
      "auth_token": Constants.Auth_Token,
      "amount_cents": "10000",
      "expiration": 3600,
      "order_id": Constants.Order_Id,
      "billing_data": {
        "apartment": "NA",
        "email": "claudette09@exa.com",
        "floor": "NA",
        "first_name": "Esraa",
        "street": "NA",
        "building": "NA",
        "phone_number": "01011442472",
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "EG",
        "last_name": "Yousef",
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": Constants.Integration_Card_Id,
      "lock_order_when_paid": "false"
    }).then((value) {
      Constants.Request_Token_Card = value.data["token"];
      print(Constants.Request_Token_Card);
      emit(RequestTokenCardSuccessState());
    }).catchError((error) {
      emit(RequestTokenCardErrorState());
    });
  }

  void getRequestTokenKiosk() {
    emit(RequestTokenKioskLoadingState());
    DioHelper.postData(endPoint: EndPoints.requestToken, data: {
      "auth_token": Constants.Auth_Token,
      "amount_cents": "10000",
      "expiration": 3600,
      "order_id": Constants.Order_Id,
      "billing_data": {
        "apartment": "NA",
        "email": "claudette09@exa.com",
        "floor": "NA",
        "first_name": "Esraa",
        "street": "NA",
        "building": "NA",
        "phone_number": "01011442472",
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "EG",
        "last_name": "Yousef",
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": Constants.Integration_Kiosk_Id,
      "lock_order_when_paid": "false"
    }).then((value) {
      Constants.Request_Token_Kiosk = value.data["token"];
      print(Constants.Request_Token_Kiosk);
      getRefCode();
      emit(RequestTokenKioskSuccessState());
    }).catchError((error) {
      emit(RequestTokenKioskErrorState());
    });
  }

  void getRefCode() {
    emit(RefCodeLoadingState());
    DioHelper.postData(endPoint: EndPoints.refCode, data: {
      "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
      "payment_token": Constants.Request_Token_Kiosk,
    }).then((value) {
      Constants.Ref_Code = value.data["id"].toString();
      print(Constants.Ref_Code);
      emit(RefCodeSuccessState());
    }).catchError((error) {
      print(error);
      emit(RefCodeErrorState());
    });
  }
}
