import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/home/presentation/manager/cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) => SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 348.w,
                  height: 50.h,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Container(
                          margin: EdgeInsets.only(
                              left: 24.07.w,
                              top: 13.h,
                              bottom: 13.h,
                              right: 7.93.w),
                          child: Image.asset(
                            AppImages.search,
                            width: 24.w,
                            height: 24.h,
                          )),
                      hintText: 'what do you search for?',
                      hintStyle: poppins14W300(color: AppColors.hintColor),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 20.h),
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.r),
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.r),
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 1),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 24.w,
                ),
                // InkWell(
                //   onTap: () {},
                //   child: Image.asset(
                //     AppImages.cart,
                //     width: 24.w,
                //     height: 24.h,
                //   ),
                // )
                // TextField(
                //   decoration: InputDecoration(
                //     enabledBorder: OutlineInputBorder(
                //       borderSide: const BorderSide(width: 2,color: AppColors.primary),
                //       borderRadius: BorderRadius.circular(30.r),
                //     ),
                //     border: OutlineInputBorder(
                //       borderSide: const BorderSide(width: 2,color: AppColors.primary),
                //       borderRadius: BorderRadius.circular(30.r),
                //     )
                //   ),
                // )
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          ImageSlideshow(
              height: 200.h,
              width: 398.w,
              isLoop: true,
              indicatorColor: AppColors.primary,
              indicatorBackgroundColor: Colors.white,
              children: HomeCubit.get(context).slider.map((i) {
                return Image.asset(i);
              }).toList()),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 17.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: poppins18W500(),
                ),
                Text(
                  "view all",
                  style: poppins12W400(),
                )
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            height: 280.h,
            child: state is HomeLoadingState
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  )
                : GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: HomeCubit.get(context).categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          SizedBox(
                            width: 100.w,
                            height: 100.h,
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: NetworkImage(
                                  HomeCubit.get(context)
                                          .categories[index]
                                          .image ??
                                      ""),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            HomeCubit.get(context).categories[index].name ?? "",
                            style: poppins14W400(),
                          )
                        ],
                      );
                    },
                  ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Brands",
                style: poppins18W500(),
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            height: 250.h,
            child: state is HomeLoadingState
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ))
                : ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => SizedBox(
                          width: 158.w,
                          height: 122.h,
                          child: Card(
                            elevation: 20.0,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            child: Image.network(
                                HomeCubit.get(context).brands[index].image ??
                                    ""),
                          ),
                        ),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: HomeCubit.get(context).brands.length),
          )
        ]),
      ),
    );
  }
}
