import 'package:dartz/dartz.dart';

import 'package:shop_admin/core/constants/failures.dart';

import '../../data/model/delivery_details_model.dart';
import '../../data/model/delivery_model.dart';
import '../repository/repository.dart';
import 'deliveries_use_case.dart';

class UpdateDeliveryCase extends DeliveriesUse<DeliveryModel,ParamUpdateDelivery>{

  final DeliveriesRepository repository;
  UpdateDeliveryCase(this.repository);


  @override
  Future<Either<Failure, DeliveryModel>> call(ParamUpdateDelivery param)async{
    return await repository.updateDeliveryDetails(param.deliveryId,param.data);
  }
}



class ParamUpdateDelivery{
  final int deliveryId;
  final String name;
  final String email;
  final int phone;

  ParamUpdateDelivery(this.name, this.email, this.phone, this.deliveryId);

  Map<String,dynamic>get data{

    return {
      'delivery_name':name,
      'delivery_email':email,
      'delivery_phone':phone.toString(),
    };

  }


}