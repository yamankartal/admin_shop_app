import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/orders_feature/domain/use_case/use_case.dart';

import '../../data/model/order_model.dart';
import '../repository/repository.dart';

class GetAcceptedOrdersCase extends OrdersUseCase<List<OrderModel>,ParamGetAcceptedOrders>{
  final OrdersRepository repository;
  GetAcceptedOrdersCase(this.repository);

  @override
  Future<Either<Failure, List<OrderModel>>> call(ParamGetAcceptedOrders param)async{
    return await repository.getAcceptedOrders();
  }

}



class ParamGetAcceptedOrders{

}