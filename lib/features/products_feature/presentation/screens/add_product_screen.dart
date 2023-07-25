import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/compenent/presentation/widgets/text_form_fieldWidget.dart';
import 'package:shop_admin/core/constants/colors.dart';
import 'package:shop_admin/features/categories_feature/presentation/bloc/categories_bloc.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/resposive.dart';
import '../../../../core/constants/widgets.dart';
import '../../../../injection.dart';
import '../bloc/products_bloc.dart';
import '../widgets/add_product_widget.dart';
import '../widgets/choose_product_category_widget.dart';
import '../widgets/choose_product_image_widget.dart';
import '../widgets/product_image_widget.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final GlobalKey<FormState> key = GlobalKey();

  final TextEditingController productName = TextEditingController();
  final TextEditingController productDescription = TextEditingController();
  final TextEditingController productPrice = TextEditingController();
  final TextEditingController productQuantity = TextEditingController();
  final TextEditingController productDiscount = TextEditingController();

  late ProductsBloc productsBloc;
   late CategoriesBloc categoriesBloc;
  @override
  void initState() {
    productsBloc = BlocProvider.of<ProductsBloc>(context);
    categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    productsBloc.add(InitChooseProductImageEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: BlocConsumer<ProductsBloc,ProductsState>(
        listenWhen: (p,c)=>p.addProductState!=c.addProductState,
        listener: (_,state){
          if(state.addProductState==States.error){
            showSnackBar(context, state.errorMsg);
          }else if(state.addProductState==States.loaded){
            Navigator.of(context).pop();
          }
        },
        buildWhen: (p,c)=>p.addProductState!=c.addProductState,
        builder: (_,state){
          if(state.addProductState==States.loading){
            return circularProgressIndicatorWidget();
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Res.font,
                ),
                Form(
                    key: key,
                    child: Column(
                      children: [
                        TextFormFieldWidget(
                          label: 'Name',
                          hint: 'Enter product Name',
                          validate: (String? val) {
                            return val!.length >= 5
                                ? null
                                : "name must be more than 4 characters";
                          },
                          textEditingController: productName,
                        ),
                        TextFormFieldWidget(
                          label: 'Description',
                          hint: 'Enter product Description',
                          validate: (String? val) {
                            return val!.length >= 5
                                ? null
                                : "Description must be more than 10 characters";
                          },
                          textEditingController: productDescription,
                        ),
                        TextFormFieldWidget(
                          textInputType: TextInputType.number,
                          label: 'Price',
                          hint: 'Enter product Price',
                          validate: (String? val) {
                            return val!.isNotEmpty ? null : "Empty";
                          },
                          textEditingController: productPrice,
                        ),
                        TextFormFieldWidget(
                          textInputType: TextInputType.number,
                          label: 'Quantity',
                          hint: 'Enter product Quantity',
                          validate: (String? val) {
                            return val!.isNotEmpty ? null : "Empty";
                          },
                          textEditingController: productQuantity,
                        ),
                        TextFormFieldWidget(
                          textInputType: TextInputType.number,
                          label: 'Discount',
                          hint: 'Enter product Discount',
                          validate: (String? val) {
                            return val!.isNotEmpty ? null : "Empty";
                          },
                          textEditingController: productDiscount,
                        ),
                      ],
                    )),
                SizedBox(
                  height: Res.font,
                ),
                ChooseProductImageWidget(productsBloc: productsBloc,),
                SizedBox(height: Res.font,),
                ChooseProductCategoryWidget(categoriesBloc: categoriesBloc,),
                const ProductImageWidget(),
              ],
            ),
          );
        },
      ),
    bottomNavigationBar:AddProductWidget(categoriesBloc: categoriesBloc, productsBloc: productsBloc, formKey: key,productDescription: productDescription,productDiscount: productDiscount,productName: productName,productPrice: productPrice,productQuantity: productQuantity,)
    );
  }
}
