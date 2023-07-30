import 'package:dartz/dartz.dart';

import 'package:shop_admin/core/constants/failures.dart';

import 'package:shop_admin/features/report_feature/data/model/report_model.dart';

import '../../../../core/constants/exceptions.dart';
import '../../domain/repository/repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../sources/remote.dart';
class ReportRepositoryImp extends ReportRepository{
  final InternetConnectionChecker internetConnectionChecker;
  final ReportRemote remote;

  ReportRepositoryImp(this.internetConnectionChecker, this.remote);

  @override
  Future<Either<Failure, ReportModel>> getReport()async{
    try{
      final res= await remote.getReport();
      final Map<String,dynamic>json=res['report'];
      return Right(ReportModel.fromJson(json));
    }
        on  ServerException{
      return Left(ServerFailure());
        }
  }

}