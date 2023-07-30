import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_admin/features/deliveries_feature/data/model/delivery_details_model.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/resposive.dart';

class BannedDeliveryWidget extends StatelessWidget {
  final Function(bool val) onChanged;
  final DeliveryDetailsModel deliveryDetailsModel;
  const BannedDeliveryWidget({Key? key, required this.deliveryDetailsModel, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(padding: EdgeInsets.symmetric(horizontal:Res.font),
      child:  Container(
          margin: EdgeInsets.only(top: Res.font),
          width: Res.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Banned",style: TextStyle(fontSize: Res.font,fontWeight: FontWeight.bold),),
              const Spacer(),
              Switch(
                activeColor: AppColor.primaryColors,
                activeTrackColor: AppColor.primaryColors,
                inactiveThumbColor:Colors.grey[200],
                inactiveTrackColor:Colors.grey[400],
                value: deliveryDetailsModel.deliveryBanned==0?false:true, onChanged: onChanged,),
            ],
          )
      ),
    );
  }
}
