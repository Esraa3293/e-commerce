import 'package:e_commerce/config/routes/app_routes.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/home/presentation/manager/cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/states.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) => state is HomeLoadingState
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColors.primary,
            ))
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GridView.builder(
                itemCount: HomeCubit.get(context).products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4/5.5,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.w),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.productDetails,
                            arguments: HomeCubit.get(context).products[index]);
                      },
                      child:
                          ProductItem(HomeCubit.get(context).products[index]));
                },
              ),
            ),
    );
  }
}
