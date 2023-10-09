import 'package:e_commerce/features/cart/presentation/pages/cart_screen.dart';
import 'package:e_commerce/features/cart/presentation/pages/kiosk.dart';
import 'package:e_commerce/features/cart/presentation/pages/payment_methods.dart';
import 'package:e_commerce/features/cart/presentation/pages/visa.dart';
import 'package:e_commerce/features/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce/features/home/presentation/pages/home.dart';
import 'package:e_commerce/features/home/presentation/pages/tabs/profile_tab.dart';
import 'package:e_commerce/features/home/presentation/widgets/sub_categories.dart';
import 'package:e_commerce/features/login/data/data_sources/sign_in_remote_dto.dart';
import 'package:e_commerce/features/login/domain/entities/SignInEntity.dart';
import 'package:e_commerce/features/login/presentation/manager/cubit.dart';
import 'package:e_commerce/features/login/presentation/pages/login.dart';
import 'package:e_commerce/features/product_details/presentation/pages/product_details.dart';
import 'package:e_commerce/features/sign_up/presentation/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String login = "login";
  static const String home = "home";
  static const String productDetails = "productDetails";
  static const String cart = "cart";
  static const String paymentMethods = "paymentMethods";
  static const String kioskScreen = "kioskScreen";
  static const String visaScreen = "visaScreen";
  static const String subCategory = "subCategory";
  static const String signUp = "/";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => SignInCubit(SignInRemoteDto()),
              child: const LoginScreen()),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case Routes.home:
        // SignInEntity signInEntity = routeSettings.arguments as SignInEntity;
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case Routes.productDetails:
        ProductDataEntity model = routeSettings.arguments as ProductDataEntity;
        return MaterialPageRoute(
          builder: (context) => ProductDetails(model),
        );
      case Routes.cart:
        return MaterialPageRoute(
          builder: (context) => const CartScreen(),
        );
      case Routes.paymentMethods:
        return MaterialPageRoute(
          builder: (context) => const PaymentMethods(),
        );
      case Routes.kioskScreen:
        return MaterialPageRoute(
          builder: (context) => const KioskScreen(),
        );
      case Routes.visaScreen:
        return MaterialPageRoute(
          builder: (context) => VisaScreen(),
        );
      case Routes.subCategory:
        return MaterialPageRoute(
          builder: (context) => const SubCategory(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => unDefinedRoute(),
        );
    }
  }

  static Widget unDefinedRoute() => const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.warning_amber, size: 35, color: Colors.grey),
              SizedBox(
                height: 7,
              ),
              Text(
                "UnDefined Route",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black54),
              )
            ],
          ),
        ),
      );
}
