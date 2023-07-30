import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/resposive.dart';
import '../bloc/products_bloc.dart';

class UpdateProductDetailsWidget extends StatelessWidget {

  final ProductsBloc productsBloc;
  final TextEditingController productName ;
  final TextEditingController productDescription;
  final TextEditingController productPrice ;
  final TextEditingController productQuantity ;
  final TextEditingController productDiscount ;
  final int index;
  const UpdateProductDetailsWidget({Key? key, required this.productsBloc, required this.productName, required this.productDescription, required this.productPrice, required this.productQuantity, required this.productDiscount, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      buildWhen: (p, c) => p.chooseImageState != c.chooseImageState,
      builder: (_, state) => MaterialButton(
        color: AppColor.primaryColors,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Res.font * 0.6),
              topRight: Radius.circular(Res.font * 0.6),
            )),
        minWidth: Res.width,
        height: Res.font * 2,
        onPressed: () {
          if (state.chooseImageState == States.init) {
            productsBloc.add(UpdateProductEvent(
              index: index,
              productDescription: productDescription.text,
              productDiscount: int.parse(productDiscount.text),
              productName: productName.text,
              productPrice: double.parse(productPrice.text),
              productQuantity: int.parse(productQuantity.text),
            ));
          } else {
            productsBloc.add(UpdateProductWithImageEvent(
                index: index,
                productDescription: productDescription.text,
                productDiscount: int.parse(productDiscount.text),
                productName: productName.text,
                productPrice: double.parse(productPrice.text),
                productQuantity: int.parse(productQuantity.text),
                oldImage: state.products[index].productImage!,
                newImage: state.image));
          }
        },
        child: Text(
          "Done",
          style: TextStyle(color: Colors.white, fontSize: Res.font),
        ),
      ),
    );
  }
}
