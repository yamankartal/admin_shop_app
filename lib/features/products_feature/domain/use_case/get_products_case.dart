import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/categories_feature/data/model/category_model.dart';
import 'package:shop_admin/features/categories_feature/domain/repository/repository.dart';
import 'package:shop_admin/features/categories_feature/domain/use_case/use_case.dart';

import '../../data/model/products_model.dart';
import '../repository/repository.dart';

class GetProductCase extends CategoriesUseCase<List<ProductModel>,ParamGetProducts>{
  final ProductsRepository repository;
  GetProductCase(this.repository);

  @override
  Future<Either<Failure, List<ProductModel>>> call(param)async{
    return await repository.getProducts();

  }
}

class ParamGetProducts{




}