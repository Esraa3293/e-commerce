import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce/features/home/presentation/manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  ProductDataEntity model;
  ProductItem(this.model,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
              color: AppColors.primary.withOpacity(.3),
              width: 2.w)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r)),
                child: Image.network(
                  model.imageCover ?? "",
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 128.h,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 8.w, vertical: 8.h),
                child: Text(
                  model.title ?? "",
                  maxLines: 2,
                  style: poppins14W400(),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Text(
                  "EGP  ${model.price ?? ""}",
                  style: poppins14W400(),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Row(
                  children: [
                    Text(
                      "Review  (${model.ratingsAverage})  ",
                      style: poppins14W400(),
                    ),
                    const Icon(
                      Icons.star,
                      color: AppColors.yellowColor,
                      size: 15,
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8.w, vertical: 8.h),
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                AppImages.like,
                width: 30.w,
                height: 30.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8.w, vertical: 8.h),
            child: Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  HomeCubit.get(context).addToCart(model.id ?? "");
                },
                child: Image.asset(
                  AppImages.add,
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
