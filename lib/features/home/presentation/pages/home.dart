import 'package:e_commerce/config/routes/app_routes.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/home/data/data_sources/remote_dto.dart';
import 'package:e_commerce/features/home/presentation/manager/cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/states.dart';
import 'package:e_commerce/features/login/domain/entities/SignInEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  List<Widget> tabs = [];

  // SignInEntity signInEntity;
  //
  // HomeScreen(this.signInEntity);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRemoteDto())
        ..getCategories()
        ..getBrands()
        ..getProducts(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeLoadingState) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Center(
                    child: CircularProgressIndicator(
                  backgroundColor: AppColors.primary,
                )),
              ),
            );
          } else if (state is HomeGetProductsErrorState){
            showDialog(context: context, builder: (context) => AlertDialog(
              title: Text("Error"),
              content: Text(state.failures.message),
            ),);
          }
          // else if(state is ChangeBottomNavBar){
          //   tabs = HomeCubit.get(context).tabs;
          //   HomeCubit.get(context).changeBottomNavBar(HomeCubit.get(context).bottomNavIndex);
          // }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              iconTheme: const IconThemeData(color: AppColors.primary),
              title: Image.asset(
                AppImages.logo,
                color: AppColors.primary,
                width: 66.w,
                height: 22.h,
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Badge(
                    alignment: Alignment.topCenter,
                    label: Text(HomeCubit.get(context).cartItems.toString() ?? ""),
                    child: IconButton(onPressed: () {
                      Navigator.pushNamed(context, Routes.cart);
                    }, icon: Icon(Icons.shopping_cart, size: 24,)),
                  ),
                )
              ],
            ),
            body: HomeCubit.get(context)
                .tabs[HomeCubit.get(context).bottomNavIndex],
            extendBody: true,
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.w),
                  topLeft: Radius.circular(15.w)),
              child: BottomNavigationBar(
                  currentIndex: HomeCubit.get(context).bottomNavIndex,
                  onTap: (value) {
                    HomeCubit.get(context).changeBottomNav(value);
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined),
                        label: "",
                        backgroundColor: AppColors.primary),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.category_outlined),
                        label: "",
                        backgroundColor: AppColors.primary),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite_border),
                        label: "",
                        backgroundColor: AppColors.primary),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline),
                        label: "",
                        backgroundColor: AppColors.primary),
                  ]),
            ),
          );
        },
      ),
    );
  }
}
