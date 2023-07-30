import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/categories_feature/domain/use_case/use_case.dart';

import '../../data/model/product_details_model.dart';
import '../../data/model/products_model.dart';
import '../repository/repository.dart';

class ChooseProductImageCase extends CategoriesUseCase<String,ParamChooseProductImage> {
  final ProductsRepository repository;

  ChooseProductImageCase(this.repository);

  @override
  Future<Either<Failure, String>> call(param) async {
    return await repository.chooseImage();
  }
}

class ParamChooseProductImage {

}
