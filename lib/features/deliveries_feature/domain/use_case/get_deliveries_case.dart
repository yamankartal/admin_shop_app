import 'package:dartz/dartz.dart';

import 'package:shop_admin/core/constants/failures.dart';

import '../../data/model/delivery_model.dart';
import '../repository/repository.dart';
import 'deliveries_use_case.dart';

class GetDeliveriesCase extends DeliveriesUse<List<DeliveryModel>,ParamGetDeliveries>{

 final DeliveriesRepository repository;
  GetDeliveriesCase(this.repository);


  @override
  Future<Either<Failure, List<DeliveryModel>>> call(ParamGetDeliveries param)async{
    return await repository.getDeliveries();
  }
}



class ParamGetDeliveries{

}