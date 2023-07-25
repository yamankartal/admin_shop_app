import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';
import '../../data/model/delivery_details_model.dart';
import '../../data/model/delivery_model.dart';

abstract class DeliveriesRepository{
  Future<Either<Failure,List<DeliveryModel>>>getDeliveries();
  Future<Either<Failure,DeliveryDetailsModel>>getDeliveryDetails(int deliveryId);
  Future<Either<Failure,DeliveryModel>>addDelivery(Map<String,dynamic>data);
  Future<Either<Failure,Unit>>deleteDelivery(int deliveryId);
  Future<Either<Failure,DeliveryModel>>updateDeliveryDetails(int deliveryId,Map<String,dynamic>data);
  Future<Either<Failure,int>>bannedDelivery(int deliveryId);
  Future<Either<Failure,int>>unBannedDelivery(int deliveryId);
}