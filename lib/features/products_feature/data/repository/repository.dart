import 'package:dartz/dartz.dart';

import 'package:shop_admin/core/constants/failures.dart';

import 'package:shop_admin/features/products_feature/data/model/products_model.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../core/constants/exceptions.dart';
import '../../domain/repository/repository.dart';
import '../model/product_details_model.dart';
import '../sources/remote.dart';

class ProductsRepositoryImp extends ProductsRepository{

  final InternetConnectionChecker internetConnectionChecker;
  final ProductsRemote remote;
  ProductsRepositoryImp(this.internetConnectionChecker, this.remote);


  @override
  Future<Either<Failure, ProductDetailsModel>> addProduct(Map<String, dynamic> data)async{
     if(await internetConnectionChecker.hasConnection){
       try{
           final res=await remote.addProduct(data);
           return res==null?Left(BackendFailure("")):Right(res);
       }
       on ServerFailure{
         return Left(ServerFailure());
       }
     }

     else{
       return Left(ConnectionFailure());
     }
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(int productId, Map<String, dynamic> data) async{
    if(await internetConnectionChecker.hasConnection){
      try{
         final res=await remote.deleteProduct(productId, data);
         return res?const Right(unit):Left(BackendFailure(""));
      }
      on ServerFailure{
        return Left(ServerFailure());
      }
    }

    else{
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts()async {
    if(await internetConnectionChecker.hasConnection){
      try{
            final res=await remote.getProducts();
            return res.isEmpty?Left(BackendFailure("")):Right(res);
      }
      on ServerFailure{
        return Left(ServerFailure());
      }
    }

    else{
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateProduct(int productId, Map<String, dynamic> data) async{
    if(await internetConnectionChecker.hasConnection){
      try{
        final res=await remote.updateProduct(productId, data);
        print(2);
        return res?const Right(unit):Left(BackendFailure(""));
      }
      on ServerFailure{
        return Left(ServerFailure());
      }
    }

    else{
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, String>> updateProductWithImage(int productId, Map<String, dynamic> data)async {
    if(await internetConnectionChecker.hasConnection){
      try{
        final res=await remote.updateProductWithImage(productId, data);
        print(res);
        return res==null?Left(BackendFailure("")):Right(res);
      }
      on ServerFailure{
        return Left(ServerFailure());
      }
    }

      return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, ProductDetailsModel>> getProductDetails(int productId)async {
    if(await internetConnectionChecker.hasConnection){
      try{
        final res = await remote.getProductDetails(productId);
        if(res['success']){
          final Map<String,dynamic>json=res['product_details'];
          return Right(ProductDetailsModel.fromJson(json));
        }

        return Left(BackendFailure(""));
      }
      on ServerFailure{
        return Left(ServerFailure());
      }
    }

    return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, String>> chooseImage()async {
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

}