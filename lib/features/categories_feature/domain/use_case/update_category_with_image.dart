import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/categories_feature/domain/repository/repository.dart';
import 'package:shop_admin/features/categories_feature/domain/use_case/use_case.dart';

class UpdateCategoryWithImageCase extends CategoriesUseCase<String,ParamUpdateWithImageCategory>{
  final CategoriesRepository repository;
  UpdateCategoryWithImageCase(this.repository);

  @override
  Future<Either<Failure, String>> call(param)async{
    return await repository.updateCategoryWithImage(param.data,param.categoryId,);

  }
}

class ParamUpdateWithImageCategory{

  final int categoryId;
  final String categoryName;
  final String oldImage;
  final String newImage;
  ParamUpdateWithImageCategory(this.categoryId, this.categoryName, this.oldImage, this.newImage);

  Map<String,dynamic>get data{
    return {
      'category_name':categoryName,
      'old_image':oldImage,
      "new_image":newImage
    };

  }


}