import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/orders_feature/domain/use_case/use_case.dart';

import '../../data/model/order_model.dart';
import '../repository/repository.dart';

class GetActiveOrdersCase extends OrdersUseCase<List<OrderModel>,ParamGetActiveOrders>{
  final OrdersRepository repository;
  GetActiveOrdersCase(this.repository);

  @override
  Future<Either<Failure, List<OrderModel>>> call(ParamGetActiveOrders param)async{
    return await repository.getActiveOrders();
  }

}



class ParamGetActiveOrders{

}