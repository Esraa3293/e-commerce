import 'package:e_commerce/config/routes/app_routes.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/cache_helper.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/home/presentation/manager/cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.primary),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Column(
            children: [
              Text(
                "Welcome, ",
                style: poppins18W500(),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  CacheHelper.removeData("User");
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.login, (route) => false);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
