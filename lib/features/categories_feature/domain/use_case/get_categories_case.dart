import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/categories_feature/data/model/category_model.dart';
import 'package:shop_admin/features/categories_feature/domain/repository/repository.dart';
import 'package:shop_admin/features/categories_feature/domain/use_case/use_case.dart';

class GetCategoriesCase extends CategoriesUseCase<List<CategoryModel>,ParamGetCategories>{
  final CategoriesRepository repository;
  GetCategoriesCase(this.repository);

  @override
  Future<Either<Failure, List<CategoryModel>>> call(param)async{
    return await repository.getCategories();

  }
}

class ParamGetCategories{



}