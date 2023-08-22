import 'package:e_commerce/features/cart/presentation/pages/cart_screen.dart';
import 'package:e_commerce/features/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce/features/home/presentation/pages/home.dart';
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
