import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/categories_feature/data/model/category_model.dart';
import 'package:shop_admin/features/categories_feature/domain/repository/repository.dart';
import 'package:shop_admin/features/categories_feature/domain/use_case/use_case.dart';

import '../../data/model/product_details_model.dart';
import '../../data/model/products_model.dart';
import '../repository/repository.dart';

class GetProductDetailsCase extends CategoriesUseCase<ProductDetailsModel,ParamGetProductDetails>{
  final ProductsRepository repository;
  GetProductDetailsCase(this.repository);

  @override
  Future<Either<Failure, ProductDetailsModel>> call(param)async{
    return await repository.getProductDetails(param.productId);

  }
}

class ParamGetProductDetails{

  final int productId;
  ParamGetProductDetails(this.productId);

}