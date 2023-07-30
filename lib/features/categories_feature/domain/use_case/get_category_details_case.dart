import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/categories_feature/data/model/category_model.dart';
import 'package:shop_admin/features/categories_feature/domain/repository/repository.dart';
import 'package:shop_admin/features/categories_feature/domain/use_case/use_case.dart';

import '../../data/model/category_details_model.dart';

class GetCategoryDetailsCase extends CategoriesUseCase<CategoryDetailsModel,ParamGetCategoryDetails>{
  final CategoriesRepository repository;
  GetCategoryDetailsCase(this.repository);

  @override
  Future<Either<Failure, CategoryDetailsModel>> call(param)async{
    return await repository.getCategoryDetails(param.categoryId);

  }
}

class ParamGetCategoryDetails{
  final int categoryId;
  ParamGetCategoryDetails(this.categoryId);


}