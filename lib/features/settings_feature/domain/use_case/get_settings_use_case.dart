import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/settings_feature/domain/use_case/settings_use_case.dart';

import '../../data/model/settings_model.dart';
import '../repository/repository.dart';

class GetSettingsCase extends SettingsUseCase<SettingsModel,ParamGetSettings>{

  final SettingsRepository repository;
  GetSettingsCase(this.repository);

  @override
  Future<Either<Failure, SettingsModel>> call(ParamGetSettings param)async{
    return await repository.getSettings();
  }
}



class ParamGetSettings{}