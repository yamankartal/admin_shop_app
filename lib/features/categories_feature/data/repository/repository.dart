import 'package:dartz/dartz.dart';
import 'package:shop_admin/compenent/data/local.dart';
import 'package:shop_admin/core/constants/exceptions.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/categories_feature/data/model/category_details_model.dart';
import 'package:shop_admin/features/categories_feature/data/model/category_model.dart';
import 'package:shop_admin/features/categories_feature/domain/repository/repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../sources/remote.dart';
class CategoriesRepositoryImp extends CategoriesRepository {

  final CategoriesRemote remote;
  final InternetConnectionChecker internetConnectionChecker;

  CategoriesRepositoryImp(this.remote, this.internetConnectionChecker);

  @override
  Future<Either<Failure, CategoryModel>> addCategory(Map<String, dynamic> data) async {
   if(await internetConnectionChecker.hasConnection){
     try {
       final res = await remote.addCategory(data);
       if(res['success']){
         final Map<String,dynamic> map=res['added_category'];
         return Right(CategoryModel.fromJson(map));
       }
       else{
         return Left(BackendFailure(res['msg']));
       }
     }
     on ServerException {
       return Left(ServerFailure());
     }
   }


   return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, Unit>> deleteCategory(int categoryId,
      String image) async {
   if(await internetConnectionChecker.hasConnection){
     try {
       final res = await remote.deleteCategory(categoryId, image);
       return res ? const Right(unit) : Left(BackendFailure(""));
     }
     on ServerException {
       return Left(ServerFailure());
     }
   }

   return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    if(await internetConnectionChecker.hasConnection){
      try {
        final res = await remote.getCategories();
        return res.isNotEmpty ? Right(res) : Left(BackendFailure(""));
      }
      on ServerException {
        return Left(ServerFailure());
      }
    }


    return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, Unit>> updateCategory(Map<String, dynamic> data,
      int categoryId) async {
   if(await internetConnectionChecker.hasConnection){
     try {
       final res = await remote.updateCategory(data, categoryId);
       return res ? const Right(unit) : Left(BackendFailure(""));
     }
     on ServerException {
       return Left(ServerFailure());
     }
   }
   return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, String>> updateCategoryWithImage(
      Map<String, dynamic> data, int categoryId) async {
    if(await internetConnectionChecker.hasConnection){
      try {
        final res = await remote.updateCategoryWithImage(data, categoryId);
        return res!=null?  Right(res) : Left(BackendFailure(""));
      }
      on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, String>> chooseImage()async{
    if(await internetConnectionChecker.hasConnection){
      try {
        final res = await remote.chooseImage();
        return res!=null?  Right(res) : Left(BackendFailure(""));
      }
      on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, CategoryDetailsModel>> getCategoryDetails(int categoryId)async {
    if(await internetConnectionChecker.hasConnection){
      try {
        final res = await remote.getCategoryDetails(categoryId);
        if(res['success']){
          final Map<String,dynamic>map=res['category_details'];
          return Right(CategoryDetailsModel.fromJson(map));
        }

        return Left(BackendFailure(""));
      }
      on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ConnectionFailure());
  }
}