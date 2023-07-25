import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/exceptions.dart';

import 'package:shop_admin/core/constants/failures.dart';

import 'package:shop_admin/features/users_feature/data/model/user_model.dart';

import '../../domain/repository/repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../sources/users_remote.dart';
class UsersRepositoryImp extends UsersRepository{
  final InternetConnectionChecker internetConnectionChecker;
  final UsersRemote remote;

  UsersRepositoryImp(this.internetConnectionChecker, this.remote);
  @override
  Future<Either<Failure, List<UserModel>>> getUsers()async{
    try{
      final res =await remote.getUsers();
      if(res['success']){
        final List list=res['users'];
        return Right(list.map((e) =>UserModel.fromJson(e)).toList());
      }
      throw ServerFailure();
    }
        on ServerException{
      return Left(ServerFailure());
        }

  }

}