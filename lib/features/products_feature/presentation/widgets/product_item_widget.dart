import 'package:flutter/material.dart';
import 'package:shop_admin/features/products_feature/data/model/products_model.dart';

import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/resposive.dart';

class ProductItemWidget extends StatelessWidget {

  final int index;
  final ProductModel productModel;


  const ProductItemWidget({Key? key, required this.index, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: Res.padding,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Res.padding)
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Res.padding,vertical: Res.padding),
          child:Row(
            children: [
              Container(
                height: Res.height*0.1,
                width: Res.width*0.2,
                decoration: BoxDecoration(
                    image:DecorationImage(
                        image: NetworkImage(
                            "$uploadLink/${productModel.productImage!}"
                        )
                    )
                ),
              ),
              SizedBox(width: Res.font,),
              Text(productModel.productName!),
              const Spacer(),
              Text(("${productModel.productDateTime!.year}/${productModel.productDateTime!.month}/${productModel.productDateTime!.day}"))
            ],
          )
      ),
    );
  }
}
