import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/report_feature/data/model/report_model.dart';
import 'package:shop_admin/features/report_feature/domain/use_case/use_case.dart';

import '../repository/repository.dart';

class GetReportCase extends ReportUseCase<ReportModel,ParamGetReport>{

  final ReportRepository repository;
  GetReportCase(this.repository);

  @override
  Future<Either<Failure, ReportModel>> call(ParamGetReport param) async{
    return await repository.getReport();
  }

}


class ParamGetReport{}