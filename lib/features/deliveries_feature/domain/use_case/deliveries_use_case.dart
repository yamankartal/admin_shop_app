import 'package:dartz/dartz.dart';

import '../../../../core/constants/failures.dart';

abstract class DeliveriesUse<Type,Param>{
  Future<Either<Failure,Type>>call(Param param);
}