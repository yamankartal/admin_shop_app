import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/compenent/presentation/widgets/text_form_fieldWidget.dart';
import 'package:shop_admin/features/categories_feature/presentation/bloc/categories_bloc.dart';
import 'package:shop_admin/features/products_feature/data/model/product_details_model.dart';
import 'package:shop_admin/features/products_feature/presentation/bloc/products_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/resposive.dart';
import '../../../../core/constants/widgets.dart';
import '../widgets/update_product_details_widget.dart';
import '../widgets/choose_product_image_widget.dart';
import '../widgets/product_image_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int index;

  const ProductDetailsScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late ProductsBloc productsBloc;
  late CategoriesBloc categoriesBloc;

  final TextEditingController productName = TextEditingController();
  final TextEditingController productDescription = TextEditingController();
  final TextEditingController productPrice = TextEditingController();
  final TextEditingController productQuantity = TextEditingController();
  final TextEditingController productDiscount = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey();

  @override
  void initState() {
    productsBloc = BlocProvider.of<ProductsBloc>(context);
    categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    productsBloc.add(GetProductDetailsEvent(
        productsBloc.state.products[widget.index].productId!));
    productsBloc.add(InitChooseProductImageEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: BlocConsumer<ProductsBloc, ProductsState>(
        listenWhen: (p, c) =>
            p.getProductDetailsState != c.getProductDetailsState,
        listener: (_, state) {
          if (state.getProductDetailsState == States.loaded) {
            final ProductDetailsModel productDetailsModel =
                state.productDetailsModel;
            productName.text = productDetailsModel.productName.toString();
            productDescription.text =
                productDetailsModel.productDescription.toString();
            productPrice.text = productDetailsModel.productPrice.toString();
            productQuantity.text =
                productDetailsModel.productQuantity.toString();
            productDiscount.text =
                productDetailsModel.productDiscount.toString();
          }
        },
        buildWhen: (p, c) =>
            p.getProductDetailsState != c.getProductDetailsState,
        builder: (_, state) => builder(
          state.getProductDetailsState,
          state.errorMsg,
          BlocConsumer<ProductsBloc, ProductsState>(
            listenWhen: (p, c) =>
                p.updateProductState != c.updateProductState ||
                p.updateProductWithImageState != c.updateProductWithImageState,
            listener: (_, state) {
              if (state.updateProductState == States.error ||
                  state.updateProductWithImageState == States.error) {
                showSnackBar(context, state.errorMsg);
              } else if (state.updateProductState == States.loaded ||
                  state.updateProductWithImageState == States.loaded) {
                Navigator.of(context).pop();
              }
            },
            buildWhen: (p, c) =>
                p.updateProductState != c.updateProductState ||
                p.updateProductWithImageState != c.updateProductWithImageState,
            builder: (_, state) {
              if (state.updateProductState == States.loading ||
                  state.updateProductWithImageState == States.loading) {
                return circularProgressIndicatorWidget();
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: key,
                      child: Column(
                        children: [
                          SizedBox(
                            height: Res.font,
                          ),
                          TextFormFieldWidget(
                            label: 'Name',
                            hint: '',
                            validate: (String? val) {
                              return val!.length < 5
                                  ? "must be more than 5 characters "
                                  : null;
                            },
                            textEditingController: productName,
                          ),
                          TextFormFieldWidget(
                            label: 'Description',
                            hint: '',
                            validate: (String? val) {
                              return val!.length < 5
                                  ? "must be more than 5 characters "
                                  : null;
                            },
                            textEditingController: productDescription,
                          ),
                          TextFormFieldWidget(
                            label: 'Price',
                            hint: '',
                            validate: (String? val) {
                              return val!.isEmpty ? "empty " : null;
                            },
                            textEditingController: productPrice,
                          ),
                          TextFormFieldWidget(
                            label: 'Quantity',
                            hint: '',
                            validate: (String? val) {
                              return val!.isEmpty ? "empty " : null;
                            },
                            textEditingController: productQuantity,
                          ),
                          TextFormFieldWidget(
                            label: 'Discount',
                            hint: '',
                            validate: (String? val) {
                              return val!.isEmpty ? "empty " : null;
                            },
                            textEditingController: productDiscount,
                          ),
                          SizedBox(
                            height: Res.font,
                          ),
                          ChooseProductImageWidget(
                            productsBloc: productsBloc,
                          ),
                          SizedBox(
                            height: Res.font,
                          ),
                          const ProductImageWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: UpdateProductDetailsWidget(productsBloc: productsBloc, productName: productName,productQuantity: productQuantity,productPrice: productPrice,productDescription: productDescription,productDiscount: productDiscount,index: widget.index, ),
    );
  }
}
