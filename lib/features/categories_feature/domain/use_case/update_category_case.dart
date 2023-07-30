import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/categories_feature/domain/repository/repository.dart';
import 'package:shop_admin/features/categories_feature/domain/use_case/use_case.dart';

class UpdateCategoryCase extends CategoriesUseCase<Unit,ParamUpdateCategory>{
  final CategoriesRepository repository;
  UpdateCategoryCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(param)async{
    return await repository.updateCategory(param.data,param.categoryId);

  }
}

class ParamUpdateCategory{

  final int categoryId;
  final String categoryName;
  ParamUpdateCategory(this.categoryId, this.categoryName);

  Map<String,dynamic>get data{
    return {
      'category_name':categoryName
    };

  }


}