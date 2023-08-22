import 'package:e_commerce/config/routes/app_routes.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/cache_helper.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primary),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(onPressed: () {
            CacheHelper.removeData("User");
            Navigator.pushNamedAndRemoveUntil(context, Routes.login, (route) => false);
          }, icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
