import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shop_admin/core/constants/backend_url.dart';
import 'package:shop_admin/core/constants/failures.dart';

import '../model/order_model.dart';

class OrdersRemote{



  Future<Map>approveOrder(int orderId, Map<String, dynamic> data)async{
    print(data);
    final response = await http.post(Uri.parse(approveOrderLink),body: data..addAll({"order_id":orderId.toString()}));
    if(response.statusCode==200){
      final res=jsonDecode(response.body);
      return res;
    }


    throw ServerFailure();


  }

  Future<Map>deleteOrder(int orderId)async{
    final response = await http.post(Uri.parse(deleteOrderLink),body:{'order_id':orderId.toString()});
    if(response.statusCode==200){
      final res=jsonDecode(response.body);
      return res;
    }


    throw ServerFailure();
  }

  Future<List<OrderModel>>getActiveOrders()async{
    final response = await http.post(Uri.parse(getActiveOrdersLink),);
    if(response.statusCode==200){
      final res=jsonDecode(response.body);
      if(res['success']){
        final List list=res['active_orders'];
        return list.map((e) => OrderModel.fromJson(e)).toList();
      }


      return [];
    }


    throw ServerFailure();
  }

  Future<List<OrderModel>>getArchivedOrders() async{
    final response = await http.post(Uri.parse(getArchivedOrdersLink),);
    if(response.statusCode==200){
      final res=jsonDecode(response.body);
      if(res['success']){
        final List list=res['archived_orders'];
        return list.map((e) => OrderModel.fromJson(e)).toList();
      }
      return [];
    }


    throw ServerFailure();
  }

  Future<List<OrderModel>>getPendingOrders()async{
    final response = await http.post(Uri.parse(getPendingOrdersLink),);
    if(response.statusCode==200){
      final res=jsonDecode(response.body);
      if(res['success']){
        final List list=res['pending_orders'];
        return list.map((e) => OrderModel.fromJson(e)).toList();
      }
      return [];
    }


    throw ServerFailure();
  }

  Future<List<OrderModel>>getWaitingOrders()async{
    final response = await http.post(Uri.parse(getAcceptedOrdersLink),);
    if(response.statusCode==200){
      final res=jsonDecode(response.body);
      if(res['success']){
        final List list=res['waiting_orders'];
        return list.map((e) => OrderModel.fromJson(e)).toList();
      }
      return [];
    }


    throw ServerFailure();
  }


  Future<Map>getOrderDetails(int orderId) async{
    final response = await http.post(Uri.parse(getOrderDetailsLink),body: {'order_id':orderId.toString()});
    if(response.statusCode==200){
      final res=jsonDecode(response.body);
     return res;
    }
    throw ServerFailure();
  }

}