import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';

import '../../data/model/user_model.dart';

abstract class UsersRepository{
  Future<Either<Failure,List<UserModel>>>getUsers();
}