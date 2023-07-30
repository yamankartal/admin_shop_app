

import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/exceptions.dart';

import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/orders_feature/data/model/order_details_model.dart';

import 'package:shop_admin/features/orders_feature/data/model/order_model.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../domain/repository/repository.dart';
import '../sources/remote.dart';

class OrdersRepositoryImp extends OrdersRepository{

  final OrdersRemote remote;
  final InternetConnectionChecker internetConnectionChecker;

  OrdersRepositoryImp(this.remote, this.internetConnectionChecker);

  @override
  Future<Either<Failure, Unit>> approveOrder(int orderId, Map<String, dynamic> data)async{
    if(await internetConnectionChecker.hasConnection){

      try{
        final res= await remote.approveOrder(orderId, data);
        if(res['success']){
          return const Right(unit);
        }
        return Left(BackendFailure('order already approved'));


      }
          on ServerException{
        return Left(ServerFailure());
          }

    }


    return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, Unit>> deleteOrder(int orderId)async {
    if(await internetConnectionChecker.hasConnection){

      try{
        final res=await remote.deleteOrder(orderId);
        if(res['success']){
          return const Right(unit);
        }
        return Left(BackendFailure("order already deleted"));
      }
      on ServerException{
        return Left(ServerFailure());
      }

    }


    return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getActiveOrders()async {
    if(await internetConnectionChecker.hasConnection){

      try{
        final res=await remote.getActiveOrders();
        return res.isEmpty?Left(BackendFailure("No Active Orders")):Right(res);

      }
      on ServerException{
        return Left(ServerFailure());
      }

    }


    return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getArchivedOrders() async{
    if(await internetConnectionChecker.hasConnection){

      try{
        final res=await remote.getArchivedOrders();
        return res.isEmpty?Left(BackendFailure("No Archived Orders")):Right(res);
      }
      on ServerException{
        return Left(ServerFailure());
      }

    }


    return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getPendingOrders()async {
    if(await internetConnectionChecker.hasConnection){

      try{
        final res=await remote.getPendingOrders();
        return res.isEmpty?Left(BackendFailure("No Pending Orders")):Right(res);
      }
      on ServerException{
        return Left(ServerFailure());
      }

    }


    return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getAcceptedOrders()async {
    if(await internetConnectionChecker.hasConnection){

      try{
        final res=await remote.getWaitingOrders();
        return res.isEmpty?Left(BackendFailure("No Accepted Orders")):Right(res);

      }
      on ServerException{
        return Left(ServerFailure());
      }

    }


    return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, OrderDetailsModel>> getOrderDetails(int orderId) async{
    if(await internetConnectionChecker.hasConnection){

      try{
        final res=await remote.getOrderDetails(orderId);
        if(res['success']){
          print(res);
          final Map<String,dynamic> map=res['order_details'];
          return Right(OrderDetailsModel.fromJson(map));
        }

        return Left(BackendFailure(""));

      }
      on ServerException{
        return Left(ServerFailure());
      }

    }


    return Left(ConnectionFailure());
  }

}