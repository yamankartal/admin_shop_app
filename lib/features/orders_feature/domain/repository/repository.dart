import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';
import '../../data/model/order_details_model.dart';
import '../../data/model/order_model.dart';

abstract class OrdersRepository{
  Future<Either<Failure,List<OrderModel>>>getPendingOrders();
  Future<Either<Failure,List<OrderModel>>>getActiveOrders();
  Future<Either<Failure,List<OrderModel>>>getArchivedOrders();
  Future<Either<Failure,List<OrderModel>>>getAcceptedOrders();
  Future<Either<Failure,OrderDetailsModel>>getOrderDetails(int orderId);
  Future<Either<Failure,Unit>>approveOrder(int orderId,Map<String,dynamic>data);
  Future<Either<Failure,Unit>>deleteOrder(int orderId);

}