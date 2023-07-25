import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/orders_feature/domain/use_case/use_case.dart';

import '../../data/model/order_model.dart';
import '../repository/repository.dart';

class DeleteOrderCase extends OrdersUseCase<Unit,ParamDeleteOrders>{
  final OrdersRepository repository;
  DeleteOrderCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ParamDeleteOrders param)async{
    return await repository.deleteOrder(param.orderId);
  }

}



class ParamDeleteOrders{
  final int orderId;

  ParamDeleteOrders(this.orderId);


}