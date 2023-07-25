import 'package:dartz/dartz.dart';

import 'package:shop_admin/core/constants/failures.dart';

import '../../data/model/delivery_details_model.dart';
import '../../data/model/delivery_model.dart';
import '../repository/repository.dart';
import 'deliveries_use_case.dart';

class UnBannedDeliveryCase extends DeliveriesUse<int,ParamUnBannedDelivery>{

  final DeliveriesRepository repository;
  UnBannedDeliveryCase(this.repository);


  @override
  Future<Either<Failure, int>> call(ParamUnBannedDelivery param)async{
    return await repository.unBannedDelivery(param.deliveryId,);
  }
}



class ParamUnBannedDelivery{
  final int deliveryId;
  ParamUnBannedDelivery(this.deliveryId);

}