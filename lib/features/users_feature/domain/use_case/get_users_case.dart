import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/users_feature/domain/use_case/users_use_case.dart';

import '../../data/model/user_model.dart';
import '../repository/repository.dart';

class GetUsersCase extends UsersUseCase<List<UserModel>,ParamGetUsers>{

  final UsersRepository repository;
  GetUsersCase(this.repository);
  @override
  Future<Either<Failure, List<UserModel>>> call(ParamGetUsers param)async{
    return await repository.getUsers();
  }
}


class ParamGetUsers{}