import 'package:dartz/dartz.dart';

import 'package:shop_admin/core/constants/failures.dart';

import '../../data/model/delivery_model.dart';
import '../repository/repository.dart';
import 'deliveries_use_case.dart';

class AddDeliveryCase extends DeliveriesUse<DeliveryModel,ParamAddDelivery>{

  final DeliveriesRepository repository;
  AddDeliveryCase(this.repository);


  @override
  Future<Either<Failure, DeliveryModel>> call(ParamAddDelivery param)async{
    return await repository.addDelivery(param.data);
  }
}



class ParamAddDelivery{
final String name;
final String email;
final int phone;
  ParamAddDelivery(this.name, this.email, this.phone);

  Map<String,dynamic>get data{

    return {
      'delivery_name':name,
      'delivery_email':email,
      'delivery_phone':phone.toString(),
    };

  }


}