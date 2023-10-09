import 'package:e_commerce/config/routes/app_routes.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/cart/data/data_sources/cart_remote_dto.dart';
import 'package:e_commerce/features/cart/presentation/manager/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/manager/cart_states.dart';
import 'package:e_commerce/features/cart/presentation/manager/payment_states.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CartCubit(CartRemoteDto())..getCart(),
        child: BlocConsumer<CartCubit, CartStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is CartSuccessState) {
              return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    centerTitle: true,
                    iconTheme: const IconThemeData(color: AppColors.primary),
                    title: Text(
                      "Cart",
                      style: poppins20W500(),
                    ),
                  ),
                  bottomNavigationBar: Container(
                    height: 100.h,
                    color: Colors.transparent,
                    padding:
                        EdgeInsets.only(top: 16.r, left: 16.r, right: 16.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Total price",
                              style: poppins18W500().copyWith(
                                  color: AppColors.hintColor.withOpacity(.6)),
                            ),
                            Text(
                              "EGP ${state.getCart.data!.totalCartPrice.toString() ?? ""}",
                              style: poppins18W500(),
                            )
                          ],
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              minimumSize: Size(230.w, 48.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Routes.paymentMethods);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Check Out",
                                  style: poppins18W500()
                                      .copyWith(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 27.w,
                                ),
                                const Icon(
                                  Icons.arrow_right_alt,
                                  color: Colors.white,
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  body: ListView.separated(
                      itemBuilder: (context, index) =>
                          CartItem(state.getCart.data!.products![index]),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: state.getCart.numOfCartItems!));
            } else {
              return const Scaffold(
                body: Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primary,
                )),
              );
            }
          },
        ));
  }
}
