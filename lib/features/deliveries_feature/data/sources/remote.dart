import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_admin/core/constants/failures.dart';

import '../../../../core/constants/backend_url.dart';


class DeliveriesRemote{

  Future<Map>addDelivery(Map<String, dynamic> data)async{
   try{
     final response = await http.post(Uri.parse(addDeliveryLink),body: data);
     if(response.statusCode==200){
       final res =jsonDecode(response.body);
       return res;
     }
       
       
       throw ServerFailure();
   }
   catch(e){
     throw ServerFailure();
   }    
  }

  Future<Map>bannedDelivery(int deliveryId) async{
    try{
      final response = await http.post(Uri.parse(bannedDeliverLink),body:{'delivery_id':deliveryId.toString()});
      if(response.statusCode==200){
        final res =jsonDecode(response.body);
        return res;
      }
      throw ServerFailure();
  }
  catch(e){
    throw ServerFailure();
    }
  }

  Future<Map>deleteDelivery(int deliveryId) async{
    try{
      final response = await http.post(Uri.parse(deleteDeliveryLink),body:{'delivery_id':deliveryId.toString()});
      if(response.statusCode==200){
        final res =jsonDecode(response.body);
        return res;
      }
      throw ServerFailure();
    }
    catch(e){
      throw ServerFailure();
    }
  }

  Future<Map>getDeliveries()async{
    try{
      final response = await http.post(Uri.parse(getDeliveriesLink),);
      if(response.statusCode==200){
        final res =jsonDecode(response.body);
        return res;
      }
      throw ServerFailure();
    }
    catch(e){
      throw ServerFailure();
    }
  }

  Future<Map>getDeliveryDetails(int deliveryId)async{
    try{
      final response = await http.post(Uri.parse(getDeliveryDetailsLink),body:{'delivery_id':deliveryId.toString()});
      if(response.statusCode==200){
        final res =jsonDecode(response.body);
        return res;
      }
      throw ServerFailure();
    }
    catch(e){
      throw ServerFailure();
    }
  }

  Future<Map>unBannedDelivery(int deliveryId) async{
    try{
      final response = await http.post(Uri.parse(unBannedDeliveryLink),body:{'delivery_id':deliveryId.toString()});
      if(response.statusCode==200){
        final res =jsonDecode(response.body);
        return res;
      }
      throw ServerFailure();
    }
    catch(e){
      throw ServerFailure();
    }
  }

  Future<Map>updateDeliveryDetails(int deliveryId, Map<String, dynamic> data)async{
    try{
      final response = await http.post(Uri.parse(updateDeliveryLink),body:data..addAll({'delivery_id':deliveryId.toString()}));
      if(response.statusCode==200){
        final res =jsonDecode(response.body);
        return res;
      }
      throw ServerFailure();
    }
    catch(e){
      throw ServerFailure();
    }
  }


}