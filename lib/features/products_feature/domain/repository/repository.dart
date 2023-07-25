import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';

import '../../data/model/product_details_model.dart';
import '../../data/model/products_model.dart';

abstract class ProductsRepository{
  Future<Either<Failure,List<ProductModel>>>getProducts();
  Future<Either<Failure,ProductDetailsModel>>addProduct(Map<String,dynamic>data);
  Future<Either<Failure,Unit>>deleteProduct(int productId,Map<String,dynamic>data);
  Future<Either<Failure,Unit>>updateProduct(int productId,Map<String,dynamic>data);
  Future<Either<Failure,String>>updateProductWithImage(int productId,Map<String,dynamic>data);
  Future<Either<Failure,ProductDetailsModel>>getProductDetails(int productId);
  Future<Either<Failure,String>>chooseImage();
}