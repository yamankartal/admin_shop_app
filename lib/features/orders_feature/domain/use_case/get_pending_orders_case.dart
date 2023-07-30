import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/orders_feature/domain/use_case/use_case.dart';

import '../../data/model/order_model.dart';
import '../repository/repository.dart';

class GetPendingOrdersCase extends OrdersUseCase<List<OrderModel>,ParamGetPendingOrders>{
  final OrdersRepository repository;
  GetPendingOrdersCase(this.repository);

  @override
  Future<Either<Failure, List<OrderModel>>> call(ParamGetPendingOrders param)async{
    return await repository.getPendingOrders();
  }

}



class ParamGetPendingOrders{

}