import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/features/products_feature/presentation/bloc/products_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/resposive.dart';
import '../../../../injection.dart';
import '../../../categories_feature/presentation/bloc/categories_bloc.dart';
import '../screens/add_product_screen.dart';

class AddProductButtonWidget extends StatelessWidget {
  const AddProductButtonWidget({Key? key, required this.productsBloc}) : super(key: key);

  final ProductsBloc productsBloc;

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      backgroundColor: AppColor.primaryColors,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider.value(value: productsBloc),
                BlocProvider(
                  create: (_) => sl<CategoriesBloc>(),
                ),
              ],
              child: const AddProductScreen(),
            ),
          ),
        );
      },
      child: Icon(
        Icons.add,
        size: Res.font * 1.2,
      ),
    );
  }
}
