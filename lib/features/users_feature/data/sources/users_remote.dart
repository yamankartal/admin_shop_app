import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_admin/core/constants/backend_url.dart';
import 'package:shop_admin/core/constants/exceptions.dart';
import 'package:shop_admin/core/constants/failures.dart';

class UsersRemote{

  Future<Map>getUsers()async{
    try{
      final response =await http.post(Uri.parse(getUsersLink));
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