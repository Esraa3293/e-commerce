import 'package:bloc/bloc.dart';
import 'package:e_commerce/config/routes/app_routes.dart';
import 'package:e_commerce/core/utils/bloc_observer.dart';
import 'package:e_commerce/core/utils/cache_helper.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  var user = CacheHelper.getData("User");
  String route;
  if (user == null) {
    route = Routes.login;
  } else {
    route = Routes.home;
  }
  runApp(MyApp(route));
}
