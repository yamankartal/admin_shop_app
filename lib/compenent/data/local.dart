import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/failures.dart';

class ComponentLocal{
  final SharedPreferences sharedPreferences;
  ComponentLocal(this.sharedPreferences);

  int? get deliveryId{
    try{
      return sharedPreferences.getInt('deliveryId');
    }
    catch(e){
      throw CacheFailure();
    }
  }

}