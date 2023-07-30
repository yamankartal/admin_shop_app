import 'package:flutter/material.dart';
import 'package:shop_admin/features/products_feature/presentation/bloc/products_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/resposive.dart';

class ChooseProductImageWidget extends StatelessWidget {
  final ProductsBloc productsBloc;

  const ChooseProductImageWidget({Key? key, required this.productsBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: Res.width * 0.8,
      height: Res.font * 1.5,
      color: AppColor.primaryColors,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Res.padding),
      ),
      child: Text(
        "Choose image",
        style: TextStyle(color: Colors.white, fontSize: Res.font),
      ),
      onPressed: () {
        productsBloc.add(
          ChooseProductImageEvent(),
        );
      },
    );
  }
}
