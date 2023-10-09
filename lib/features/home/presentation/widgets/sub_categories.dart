import 'package:e_commerce/features/home/data/data_sources/remote_dto.dart';
import 'package:e_commerce/features/home/presentation/manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategory extends StatelessWidget {
  const SubCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ListView.builder(
            itemBuilder: (context, index) =>
                Text(HomeCubit.get(context).categories[index].name ?? ""),
            itemCount: HomeCubit.get(context).categories.length,
          )
        ],
      ),
    );
  }
}
