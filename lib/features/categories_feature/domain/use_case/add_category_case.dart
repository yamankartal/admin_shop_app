import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/categories_feature/data/model/category_model.dart';
import 'package:shop_admin/features/categories_feature/domain/repository/repository.dart';
import 'package:shop_admin/features/categories_feature/domain/use_case/use_case.dart';

class AddCategoryCase extends CategoriesUseCase<CategoryModel,ParamAddCategory>{
 final CategoriesRepository repository;
  AddCategoryCase(this.repository);

  @override
  Future<Either<Failure, CategoryModel>> call(param)async{
    return await repository.addCategory(param.data);

  }
}

class ParamAddCategory{

  final String categoryName;
  final String categoryImage;
  final DateTime dateTime;
  ParamAddCategory(this.categoryName, this.categoryImage, this.dateTime);

  Map<String,dynamic>get data{
   return {
    'category_name':categoryName,
    'category_image':categoryImage,
    'category_date_time':dateTime.toIso8601String(),
   };
  }


}