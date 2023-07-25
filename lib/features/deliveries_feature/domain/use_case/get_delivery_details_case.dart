import 'package:dartz/dartz.dart';

import 'package:shop_admin/core/constants/failures.dart';

import '../../data/model/delivery_details_model.dart';
import '../../data/model/delivery_model.dart';
import '../repository/repository.dart';
import 'deliveries_use_case.dart';

class GetDeliveryDetailsCase extends DeliveriesUse<DeliveryDetailsModel,ParamGetDeliveryDetails>{

  final DeliveriesRepository repository;
  GetDeliveryDetailsCase(this.repository);


  @override
  Future<Either<Failure, DeliveryDetailsModel>> call(ParamGetDeliveryDetails param)async{
    return await repository.getDeliveryDetails(param.deliveryId);
  }
}



class ParamGetDeliveryDetails{
  final int deliveryId;

  ParamGetDeliveryDetails(this.deliveryId);
}