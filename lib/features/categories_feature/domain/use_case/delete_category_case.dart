import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/categories_feature/domain/repository/repository.dart';
import 'package:shop_admin/features/categories_feature/domain/use_case/use_case.dart';

class DeleteCategoryCase extends CategoriesUseCase<Unit,ParamDeleteCategory>{
  final CategoriesRepository repository;
  DeleteCategoryCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(param)async{
    return await repository.deleteCategory(param.categoryId,param.image);

  }
}

class ParamDeleteCategory{

  final int categoryId;
  final String image;
  ParamDeleteCategory(this.categoryId, this.image);


}