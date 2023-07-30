import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/orders_feature/domain/use_case/use_case.dart';

import '../../data/model/order_model.dart';
import '../repository/repository.dart';

class ApproveOrderCase extends OrdersUseCase<Unit,ParamApproveOrders>{
  final OrdersRepository repository;
  ApproveOrderCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ParamApproveOrders param)async{
    return await repository.approveOrder(param.orderId, param.data);
  }

}



class ParamApproveOrders{
  final int orderId;
  final DateTime dateTime;

  ParamApproveOrders(this.orderId, this.dateTime);

  Map<String,dynamic>get data{
    return {"date_time":dateTime.toIso8601String()};
  }

}