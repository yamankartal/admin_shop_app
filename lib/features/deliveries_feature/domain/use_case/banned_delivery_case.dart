import 'package:dartz/dartz.dart';

import 'package:shop_admin/core/constants/failures.dart';

import '../../data/model/delivery_details_model.dart';
import '../../data/model/delivery_model.dart';
import '../repository/repository.dart';
import 'deliveries_use_case.dart';

class BannedDeliveryCase extends DeliveriesUse<int,ParamBannedDelivery>{

  final DeliveriesRepository repository;
  BannedDeliveryCase(this.repository);


  @override
  Future<Either<Failure, int>> call(ParamBannedDelivery param)async{
    return await repository.bannedDelivery(param.deliveryId,);
  }
}



class ParamBannedDelivery{
  final int deliveryId;
  ParamBannedDelivery(this.deliveryId);

}