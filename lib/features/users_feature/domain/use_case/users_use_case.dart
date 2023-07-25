import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';

abstract class UsersUseCase<Type,Param>{
  Future<Either<Failure,Type>>call(Param param);
}