import 'package:dartz/dartz.dart';
import 'package:e_commerce/config/routes/app_routes.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/home/domain/entities/ProductEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  ProductDataEntity model;

  ProductDetails(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: poppins20W500(),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: AppColors.hintColor),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Container(
                  width: 398.w,
                  height: 300.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(
                          color: AppColors.primary.withOpacity(.3),
                          width: 2.w)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: ImageSlideshow(
                        height: 300.h,
                        width: double.infinity,
                        isLoop: true,
                        indicatorColor: AppColors.primary,
                        indicatorBackgroundColor: Colors.white,
                        children: [
                          Image.network(
                            model.images?.first ?? "",
                            fit: BoxFit.fill,
                          ),
                          Image.network(
                            model.images?[1] ?? "",
                            fit: BoxFit.fill,
                          ),
                          Image.network(
                            model.images?[2] ?? "",
                            fit: BoxFit.fill,
                          ),
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      model.title ?? "",
                      maxLines: 1,
                      style: poppins18W500(),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "EGP ${model.price ?? ""}",
                    style: poppins18W500(),
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                            color: AppColors.primary.withOpacity(.3),
                            width: 1.w)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      child: Text(
                        "${model.sold ?? ""} Sold",
                        style: poppins18W500(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  const Icon(
                    Icons.star,
                    color: AppColors.yellowColor,
                    size: 15,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "${model.ratingsAverage.toString() ?? ""} (${model.ratingsQuantity ?? ""})",
                    style: poppins14W400(),
                  ),
                  const Spacer(),
                  Container(
                    width: 110.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove_circle_outline,
                                color: Colors.white,
                                size: 20.r,
                              )),
                        ),
                        Expanded(

                          child: Text(
                            "1",
                            style: poppins18W500().copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                                size: 20.r,
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Description",
                style: poppins18W500(),
              ),
              SizedBox(
                height: 8.h,
              ),
              SingleChildScrollView(
                child: ReadMoreText(
                  model.description ?? "",
                  trimLines: 3,
                  colorClickableText: AppColors.primary,
                  style: poppins14W400()
                      .copyWith(color: AppColors.hintColor.withOpacity(.6)),
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show More',
                  trimExpandedText: 'Show Less',
                  moreStyle: poppins14W400(),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Total Price",
                        style: poppins18W500().copyWith(
                            color: AppColors.hintColor.withOpacity(.6)),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        "EGY 3,500",
                        style: poppins18W500(),
                      )
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          fixedSize: Size(240.w, 60.h)),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 25.w),
                            child: Icon(
                              Icons.shopping_cart_checkout_sharp,
                              size: 24,
                            ),
                          ),
                          SizedBox(
                            width: 24.w,
                          ),
                          Text(
                            "Add to cart",
                            style:
                                poppins20W500().copyWith(color: Colors.white),
                          )
                        ],
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
