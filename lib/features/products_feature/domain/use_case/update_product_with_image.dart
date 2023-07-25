import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/categories_feature/domain/use_case/use_case.dart';

import '../repository/repository.dart';

class UpdateProductWithImageCase extends CategoriesUseCase<String, ParamUpdateProductWithImage> {
  final ProductsRepository repository;

  UpdateProductWithImageCase(this.repository);

  @override
  Future<Either<Failure, String>> call(param) async {
    return await repository.updateProductWithImage(param.productId, param.data);
  }
}

class ParamUpdateProductWithImage {
  final int productId;
  final String productName;
  final String productDescription;
  final double productPrice;
  final int productQuantity;
  final int productDiscount;
  final String oldImage;
  final String newImage;

  ParamUpdateProductWithImage(
      {
        required this.newImage,
        required this.oldImage,
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
      "old_image":oldImage.toString(),
      "new_image":newImage.toString(),




    };
  }
}
