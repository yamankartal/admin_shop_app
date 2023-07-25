import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_admin/core/constants/failures.dart';

import '../../../../core/constants/backend_url.dart';
import '../../../../core/constants/exceptions.dart';

class ReportRemote{
  Future<Map>getReport()async{
   try{
     final  response = await http.post(Uri.parse(getReportLink));
     if(response.statusCode==200){
       final res=jsonDecode(response.body);
       return res;
     }
     throw ServerException();
   }
       catch(e){
     throw ServerException();
       }
  }
}