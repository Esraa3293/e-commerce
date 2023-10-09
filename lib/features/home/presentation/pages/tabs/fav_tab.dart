import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/home/data/data_sources/remote_dto.dart';
import 'package:e_commerce/features/home/presentation/manager/cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/states.dart';
import 'package:e_commerce/features/home/presentation/widgets/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavTab extends StatelessWidget {
  const FavTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(HomeRemoteDto())..getWishlist(),
        child: BlocConsumer<HomeCubit, HomeStates>(
            listener: (context, state) {
              if (state is HomeRemoveFromWishlistSuccessState) {
                HomeCubit.get(context).getWishlist();
              }
            },
            builder: (context, state) => state is HomeGetWishlistLoadingState
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ))
                : Scaffold(
                    body: ListView.separated(
                        itemBuilder: (context, index) => FavoriteItem(
                            HomeCubit.get(context).favorites[index]),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: HomeCubit.get(context).favorites.length),
                  )));
  }
}
