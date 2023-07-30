import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/core/constants/enums.dart';
import 'package:shop_admin/features/categories_feature/presentation/bloc/categories_bloc.dart';
import 'package:shop_admin/features/products_feature/presentation/bloc/products_bloc.dart';
import 'package:shop_admin/features/products_feature/presentation/screens/product_details_screen.dart';

import '../../../../core/constants/resposive.dart';
import '../../../../core/constants/widgets.dart';
import '../../../../injection.dart';
import '../widgets/add_product_button_widget.dart';
import '../widgets/delete_product_dialog_widget.dart';
import '../widgets/product_item_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late ProductsBloc productsBloc;

  @override
  void initState() {
    productsBloc = BlocProvider.of<ProductsBloc>(context);
    productsBloc.add(GetProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        buildWhen: (p, c) => p.getProductsState != c.getProductsState,
        builder: (_, state) => builder(
          state.getProductsState,
          state.errorMsg,
          BlocConsumer<ProductsBloc, ProductsState>(
            buildWhen: (p, c) => p.deleteProductState != c.deleteProductState,
            listenWhen: (p, c) => p.deleteProductState != c.deleteProductState,
            builder: (_, state) {
              if (state.deleteProductState == States.loading) {
                return circularProgressIndicatorWidget();
              }

              return ListView.separated(
                  padding: EdgeInsets.symmetric(
                      vertical: Res.font, horizontal: Res.padding * 0.5),
                  itemBuilder: (_, index) => InkWell(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (_) => DeleteProductDialogWidget(
                            index: index,
                            productsBloc: productsBloc,
                          ),
                        );
                      },
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => MultiBlocProvider(
                              providers: [
                                BlocProvider.value(value: productsBloc),
                                BlocProvider(
                                  create: (_) => sl<CategoriesBloc>(),
                                ),
                              ],
                              child: ProductDetailsScreen(
                                index: index,
                              ),
                            ),
                          ),
                        );
                      },
                      child: ProductItemWidget(
                        index: index,
                        productModel: state.products[index],
                      )),
                  separatorBuilder: (_, index) => SizedBox(
                        height: Res.padding,
                      ),
                  itemCount: state.products.length);
            },
            listener: (_, state) {
              if (state.deleteProductState == States.error) {
                showSnackBar(context, state.errorMsg);
              }
            },
          ),
        ),
      ),
      floatingActionButton: AddProductButtonWidget(
        productsBloc: productsBloc,
      ),
    );
  }
}
