import 'package:flutter/material.dart';
import 'package:shop_admin/features/products_feature/presentation/bloc/products_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/resposive.dart';

class DeleteProductDialogWidget extends StatelessWidget {
  final int index;
  final ProductsBloc productsBloc;

  const DeleteProductDialogWidget(
      {Key? key, required this.index, required this.productsBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Are you sure you want to delete this item ?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "No",
            style: TextStyle(color: AppColor.primaryColors, fontSize: Res.font),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            productsBloc.add(DeleteProductEvent(index));
          },
          child: Text(
            "Yes",
            style: TextStyle(color: AppColor.primaryColors, fontSize: Res.font),
          ),
        ),
      ],
    );
  }
}
