import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';

import '../../data/model/report_model.dart';

abstract class ReportRepository{
  Future<Either<Failure,ReportModel>>getReport();
}