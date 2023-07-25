import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/categories_feature/domain/repository/repository.dart';
import 'package:shop_admin/features/categories_feature/domain/use_case/use_case.dart';

import '../repository/repository.dart';

class DeleteProductCase extends CategoriesUseCase<Unit,ParamDeleteProduct>{
  final ProductsRepository repository;
  DeleteProductCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(param)async{
    return await repository.deleteProduct(param.productId,param.data);

  }
}

class ParamDeleteProduct{

  final int productId;
  final String image;
  ParamDeleteProduct({required this.productId, required this.image});

  Map<String,dynamic>get data{
    return {"old_image":image  };
}


}