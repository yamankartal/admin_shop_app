import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/orders_feature/data/model/order_details_model.dart';
import 'package:shop_admin/features/orders_feature/domain/use_case/use_case.dart';

import '../../data/model/order_model.dart';
import '../repository/repository.dart';

class GetOrderDetailsCase extends OrdersUseCase<OrderDetailsModel,ParamGetOrderDetails>{
  final OrdersRepository repository;
  GetOrderDetailsCase(this.repository);

  @override
  Future<Either<Failure, OrderDetailsModel>> call(ParamGetOrderDetails param)async{
    return await repository.getOrderDetails(param.orderId);
  }

}



class ParamGetOrderDetails{
 final int orderId;

  ParamGetOrderDetails(this.orderId);
}