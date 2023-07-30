import 'dart:core';
import 'package:dartz/dartz.dart';
import '../../../../core/constants/failures.dart';
import '../../data/model/category_details_model.dart';
import '../../data/model/category_model.dart';
abstract class CategoriesRepository{
  Future<Either<Failure,List<CategoryModel>>>getCategories();
  Future<Either<Failure,CategoryModel>>addCategory(Map<String,dynamic>data);
  Future<Either<Failure,Unit>>updateCategory(Map<String,dynamic>data,int categoryId,);
  Future<Either<Failure,String>>updateCategoryWithImage(Map<String,dynamic>data,int categoryId);
  Future<Either<Failure,Unit>>deleteCategory(int categoryId,String image);
  Future<Either<Failure,String>>chooseImage();
  Future<Either<Failure,CategoryDetailsModel>>getCategoryDetails(int categoryId);
}

