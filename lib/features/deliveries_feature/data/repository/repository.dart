import 'package:dartz/dartz.dart';

import 'package:shop_admin/core/constants/failures.dart';

import 'package:shop_admin/features/deliveries_feature/data/model/delivery_details_model.dart';

import 'package:shop_admin/features/deliveries_feature/data/model/delivery_model.dart';

import '../../domain/repository/repository.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../sources/remote.dart';
class DeliveriesRepositoryImp extends DeliveriesRepository{
  final InternetConnectionChecker internetConnectionChecker;
  final DeliveriesRemote remote;
  DeliveriesRepositoryImp(this.internetConnectionChecker, this.remote);

  @override
  Future<Either<Failure, DeliveryModel>> addDelivery(Map<String, dynamic> data)async{
    if(await internetConnectionChecker.hasConnection){
      try{
        final res = await remote.addDelivery(data);
        if(res['success']){
         final Map<String,dynamic>json=res['added_delivery'];
         return Right(DeliveryModel.fromJson(json));
        }
        return Left(BackendFailure("can not add delivery"));
      }

      on ServerFailure{
        return Left(ServerFailure());
      }
    }


    return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, int>> bannedDelivery(int deliveryId) async{
    if(await internetConnectionChecker.hasConnection){
      try{
        final res = await remote.bannedDelivery(deliveryId);
        if(res['success']){
          return Right(res['delivery_banned']);
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
  Future<Either<Failure, Unit>> deleteDelivery(int deliveryId) async{
    if(await internetConnectionChecker.hasConnection){
      try{
        final res = await remote.deleteDelivery(deliveryId);
        if(res['success']){
         return const Right(unit);
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
  Future<Either<Failure, List<DeliveryModel>>> getDeliveries()async {
    if(await internetConnectionChecker.hasConnection){
      try{
        final res = await remote.getDeliveries();
        if(res['success']){
          final List  list = res['deliveries'];
          return Right(list.map((e) =>DeliveryModel.fromJson(e)).toList());
        }
        return Left(BackendFailure("No Deliveries Found"));
      }

      on ServerFailure{
        return Left(ServerFailure());
      }
    }


    return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, DeliveryDetailsModel>> getDeliveryDetails(int deliveryId)async{
    if(await internetConnectionChecker.hasConnection){
      try{
        final res = await remote.getDeliveryDetails(deliveryId);
        if(res['success']){
          final Map<String,dynamic>json=res['delivery_details'];
          return Right(DeliveryDetailsModel.fromJson(json));
        }
        return Left(BackendFailure("can not add delivery"));
      }

      on ServerFailure{
        return Left(ServerFailure());
      }
    }


    return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, int>> unBannedDelivery(int deliveryId) async{
    if(await internetConnectionChecker.hasConnection){
      try{
        final res = await remote.unBannedDelivery(deliveryId);
        if(res['success']){
          return  Right(res['delivery_banned']);
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
  Future<Either<Failure, DeliveryModel>> updateDeliveryDetails(int deliveryId, Map<String, dynamic> data)async {
    if(await internetConnectionChecker.hasConnection){
      try{
        final res = await remote.updateDeliveryDetails(deliveryId,data);
        if(res['success']){

          final Map<String,dynamic>json=res['updated_delivery'];
          return Right(DeliveryModel.fromJson(json));
        }
        return Left(BackendFailure("can update delivery"));
      }

      on ServerFailure{
        return Left(ServerFailure());
      }
    }


    return Left(ConnectionFailure());
  }
}