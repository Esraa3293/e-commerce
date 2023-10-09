import 'package:e_commerce/config/routes/app_routes.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/cart/presentation/manager/payment_cubit.dart';
import 'package:e_commerce/features/cart/presentation/manager/payment_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit()
        ..getAuthToken()
        ..getOrderId()
        ..getRequestTokenKiosk()
        ..getRefCode(),
      child: BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {
          if (state is RefCodeSuccessState) {}
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(
              "Payment Methods",
              style: poppins20W500().copyWith(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: AppColors.primary,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.visaScreen);
                        },
                        child: Text("Visa"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            minimumSize: Size(double.infinity, 70.h)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.kioskScreen);
                        },
                        child: Text("Kiosk"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            minimumSize: Size(double.infinity, 70.h)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
