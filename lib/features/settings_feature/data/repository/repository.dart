import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/exceptions.dart';

import 'package:shop_admin/core/constants/failures.dart';

import 'package:shop_admin/features/settings_feature/data/model/settings_model.dart';

import '../../domain/repository/repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../sources/remote.dart';
class SettingsRepositoryImp extends SettingsRepository{

  final InternetConnectionChecker internetConnectionChecker;
  final SettingsRemote remote;
  SettingsRepositoryImp(this.internetConnectionChecker, this.remote);

  @override
  Future<Either<Failure, SettingsModel>> getSettings()async{
    try{
      final res = await remote.getSettings();
      if(res['success']){
        final Map<String,dynamic>json=res['settings'];
        return Right(SettingsModel.fromJson(json));
      }
      return Left(BackendFailure(""));
    }
        on ServerException{
      return Left(ServerFailure());
        }
  }

  @override
  Future<Either<Failure, SettingsModel>> updateSettings(Map<String, dynamic> data)async{
    try{
      final res = await remote.updateSettings(data);
      if(res['success']){
        final Map<String,dynamic>json=res['updated_settings'];
        return Right(SettingsModel.fromJson(json));
      }
      return Left(BackendFailure("settings updated successfully"));
    }
    on ServerException{
      return Left(ServerFailure());
    }
  }
}