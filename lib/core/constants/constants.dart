
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:shop_admin/features/orders_feature/presentation/bloc/orders_bloc.dart';

import 'enums.dart';

final  GlobalKey<NavigatorState>navigatorKey=GlobalKey();

const String apiKey="AIzaSyBWNYOLMc9NK_vZtMFYJWIkBlkole8kQa8";
const String serverKey="RlP3d6tJTbsvhY3zvt0XuzC3VwvccwH_DMWOkyrPVEtP8ftKURXr2NthQnE5HC4lCJhKUTjrrRKDJbMsrcULYboZ9fFH64Xfu89z4xjGARBDbnaX_1rfSoCby89BfLblwz";
const String token="ckBOYR9AT86CwyU8SCF4nj:APA91bEik_FRJ5SdgRklASf-4I6vS7QGUr-LYVT0oqlxsKQTAmKqlAB6Hwn6j_UbibCE8szOWG6TdUMNwf8uIIUywgVezVkOzkLDY1mtw6uvVYxBPfIJzGWJhZscpBb2SfwI6d8lN2CZ";


Screen screen=Screen.other;


String time(int val){
  if(val>9) {
    return val.toString();
  }
  return "0$val";
}


listenToNotification(final OrdersBloc ordersBloc){




   FirebaseMessaging.onMessage.listen((event) {

      final Map<String,dynamic> map=event.data;
      final body=jsonDecode(map['body']);

      if( (map['pagename']=="pending"&&screen==Screen.pending )|| (map['pagename']=="accepted"&&screen==Screen.accepted) || (map['pagename']=="active"&&screen==Screen.active) ){
        final int orderId=int.parse(body['order_id']);
         ordersBloc.add(RefreshOrdersEvent(orderId));
      }

    else{
        FlutterRingtonePlayer.playNotification(volume:5);
      }


   });
}

  initFireBaseMessaging()async{
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: true,
    criticalAlert: true,
    provisional: true,
    sound: true,
  );
}



















