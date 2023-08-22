import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/cart/data/models/GetCart.dart';
import 'package:e_commerce/features/cart/presentation/manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  Products products;

  CartItem(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: 398.w,
        height: 120.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppColors.primary.withOpacity(.3))),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.network(
                products.product?.imageCover ?? "",
                height: double.infinity,
                width: 120.w,
                fit: BoxFit.fill,
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            products.product?.title ?? "",
                            style: poppins18W500(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              CartCubit.get(context).removeCartItem(products.product?.id ?? "");
                            },
                            icon: const Icon(
                              Icons.delete_forever_outlined,
                              color: AppColors.primary,
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EGP ${products.price.toString() ?? ""}",
                          style: poppins18W500(),
                        ),
                        Container(
                          width: 110.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    int counter = products.count ?? 0;
                                    counter--;
                                    CartCubit.get(context).updateCart(products.product?.id ?? "", counter);
                                  },
                                  icon: Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.white,
                                    size: 20.r,
                                  )),
                              Text(
                                products.count.toString() ?? "",
                                style: poppins18W500()
                                    .copyWith(color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: () {
                                    int counter = products.count ?? 0;
                                    counter++;
                                    CartCubit.get(context).updateCart(products.product?.id ?? "", counter);
                                  },
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.white,
                                    size: 20.r,
                                  ))
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
