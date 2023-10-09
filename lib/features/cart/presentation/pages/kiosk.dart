import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/features/cart/presentation/manager/payment_cubit.dart';
import 'package:e_commerce/features/cart/presentation/manager/payment_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KioskScreen extends StatelessWidget {
  const KioskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit()..getRefCode(),
      child: BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {},
        builder: (context, state) => SafeArea(
          child: Scaffold(
            body: Center(
                child: Text(
                    "Please, Go To Supermarket and Pay with \nReference Code: ${Constants.Ref_Code}")),
          ),
        ),
      ),
    );
  }
}
