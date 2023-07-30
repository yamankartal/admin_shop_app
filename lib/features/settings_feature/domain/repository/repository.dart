import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';

import '../../data/model/settings_model.dart';

abstract class SettingsRepository{
  Future<Either<Failure,SettingsModel>>getSettings();
  Future<Either<Failure,SettingsModel>>updateSettings(Map<String,dynamic>data);
}