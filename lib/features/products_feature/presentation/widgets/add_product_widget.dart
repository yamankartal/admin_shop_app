import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/features/categories_feature/presentation/bloc/categories_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/resposive.dart';
import '../../../../core/constants/widgets.dart';
import '../bloc/products_bloc.dart';

class AddProductWidget extends StatelessWidget {
  final TextEditingController productName ;
  final TextEditingController productDescription ;
  final TextEditingController productPrice ;
  final TextEditingController productQuantity ;
  final TextEditingController productDiscount;
  final CategoriesBloc categoriesBloc;
  final ProductsBloc productsBloc;
  final GlobalKey<FormState>formKey;
  const AddProductWidget({Key? key, required this.categoriesBloc, required this.productsBloc, required this.formKey, required this.productName, required this.productDescription, required this.productPrice, required this.productQuantity, required this.productDiscount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ProductsBloc,ProductsState>(
      buildWhen: (p,c)=>p.chooseImageState!=c.chooseImageState,
      builder: (_,state)=>MaterialButton(
        height: Res.font * 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Res.padding),
            topRight: Radius.circular(Res.padding),
          ),),
        color: AppColor.primaryColors,
        onPressed: () {

          if(state.chooseImageState==States.loaded){
            if(categoriesBloc.state.categoryIndex==-1){
              showSnackBar(context, "choose product category");
            }else{
              if (formKey.currentState!.validate()) {
                productsBloc.add(AddProductEvent(productName: productName.text, productDescription: productDescription.text, productPrice: double.parse(productPrice.text), productCategoryId: categoriesBloc.state.categories[categoriesBloc.state.categoryIndex].categoryId!, productQuantity:int.parse( productQuantity.text), productImage: state.image, productDiscount:int.parse( productDiscount.text), productDateTime:DateTime.now()));
              }
            }

          }else{
            showSnackBar(context, "choose image first");
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
