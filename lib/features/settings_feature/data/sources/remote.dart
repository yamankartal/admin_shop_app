import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_admin/core/constants/backend_url.dart';
import 'package:shop_admin/core/constants/failures.dart';

import '../../../../core/constants/exceptions.dart';


class SettingsRemote{


  Future<Map>getSettings()async{
    try{
      final response = await http.post(Uri.parse(getSettingsLink));
      if(response.statusCode==200){
        final res= jsonDecode(response.body);
        return res;
      }
      throw ServerException();
    }
        catch(e){
      throw ServerException();
    }
  }

  Future<Map>updateSettings(Map<String,dynamic>data)async{
    try{
      final response = await http.post(Uri.parse(updateSettingsLink),body: data);
      if(response.statusCode==200){
        final res= jsonDecode(response.body);
        return res;
      }
      throw ServerException();
    }
    catch(e){
      throw ServerException();
    }
  }


}