import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/home/domain/entities/GetWishlistEntity.dart';
import 'package:e_commerce/features/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce/features/home/presentation/manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoriteItem extends StatelessWidget {
  DataWishlist model;

  FavoriteItem(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.r),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: .2,
            motion: const DrawerMotion(),
            children: [
          SlidableAction(
            onPressed: (context) {
              HomeCubit.get(context).deleteFromWishlist(model.id ?? "");
            },
            label: "Delete",
            icon: Icons.delete_forever_outlined,
            backgroundColor: AppColors.primary,
            borderRadius: BorderRadius.circular(20.r),
          )
        ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
            width: 398.w,
            height: 120.h,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary.withOpacity(.3)),
                borderRadius: BorderRadius.circular(20.r)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.network(
                    model.imageCover ?? "",
                    width: 120.w,
                    height: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                model.title ?? "",
                                style: poppins18W500(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.favorite,
                                  color: AppColors.primary,
                                  size: 24,
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "EGP ${model.price.toString() ?? ""}",
                              style: poppins18W500(),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                HomeCubit.get(context).addToCart(model.id ?? "");
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.r))),
                              child: Text(
                                "Add to Cart",
                                style:
                                    poppins18W500().copyWith(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
