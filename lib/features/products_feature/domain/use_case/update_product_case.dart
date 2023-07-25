import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/categories_feature/domain/use_case/use_case.dart';

import '../repository/repository.dart';

class UpdateProductCase extends CategoriesUseCase<Unit, ParamUpdateProduct> {
  final ProductsRepository repository;

  UpdateProductCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(param) async {
    return await repository.updateProduct(param.productId, param.data);
  }
}

class ParamUpdateProduct {
  final int productId;
  final String productName;
  final String productDescription;
  final double productPrice;
  final int productQuantity;
  final int productDiscount;

  ParamUpdateProduct(
      {
        required this.productId,
        required this.productName,
      required this.productDescription,
      required this.productPrice,
      required this.productQuantity,
      required this.productDiscount});

  Map<String, dynamic> get data {
    return {
      "product_id":productId.toString(),
      "product_name":productName,
      "product_description":productDescription,
      "product_price":productPrice.toString(),
      "product_quantity":productQuantity.toString(),
      "product_discount":productDiscount.toString(),




    };
  }
}
