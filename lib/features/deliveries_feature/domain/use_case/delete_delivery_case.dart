import 'package:dartz/dartz.dart';

import 'package:shop_admin/core/constants/failures.dart';

import '../../data/model/delivery_details_model.dart';
import '../../data/model/delivery_model.dart';
import '../repository/repository.dart';
import 'deliveries_use_case.dart';

class DeleteDeliveryCase extends DeliveriesUse<Unit,ParamDeleteDelivery>{

  final DeliveriesRepository repository;
  DeleteDeliveryCase(this.repository);


  @override
  Future<Either<Failure, Unit>> call(ParamDeleteDelivery param)async{
    return await repository.deleteDelivery(param.deliveryId,);
  }
}



class ParamDeleteDelivery{
  final int deliveryId;
  ParamDeleteDelivery(this.deliveryId);

}