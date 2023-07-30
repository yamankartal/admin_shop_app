import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/categories_feature/domain/use_case/use_case.dart';

import '../../data/model/product_details_model.dart';
import '../../data/model/products_model.dart';
import '../repository/repository.dart';

class AddProductCase extends CategoriesUseCase<ProductDetailsModel, ParamAddProduct> {
  final ProductsRepository repository;

  AddProductCase(this.repository);

  @override
  Future<Either<Failure, ProductDetailsModel>> call(param) async {
    return await repository.addProduct(param.data);
  }
}

class ParamAddProduct {
  final String productName;
  final String productDescription;
  final double productPrice;
  final int productCategoryId;
  final int productQuantity;
  final String productImage;
  final int productDiscount;
  final DateTime productDateTime;

  ParamAddProduct(
      {required this.productName,
      required this.productDescription,
      required this.productPrice,
      required this.productCategoryId,
      required this.productQuantity,
      required this.productImage,
      required this.productDiscount,
      required this.productDateTime});

  Map<String, dynamic> get data {
    return {
      'product_name':productName,
      'product_description':productDescription,
      'product_price':productPrice.toString(),
      'category_id':productCategoryId.toString(),
      'product_quantity':productQuantity.toString(),
      'product_discount':productDiscount.toString(),
      'product_image':productImage.toString(),
      'product_date_time':productDateTime.toIso8601String(),
    };
  }
}
