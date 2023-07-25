import 'package:flutter/material.dart';
import 'package:shop_admin/core/constants/colors.dart';

import '../../../../core/constants/resposive.dart';

class DeliveryItemWidget extends StatelessWidget {
  final String label;
  final String trailing;
  final Color color;
  final FontWeight fontWeight;
  const DeliveryItemWidget(
      {Key? key, required this.label, required this.trailing,this.color=Colors.black45,this.fontWeight=FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label,style: TextStyle(color: color,fontSize: Res.font,fontWeight: fontWeight,height: Res.tinyFont*0.7),),
        Text(trailing.length>10?"${trailing.substring(0,10)}...":trailing,style: TextStyle(color:AppColor.primaryColors,fontSize: Res.font,fontWeight: fontWeight,height: Res.tinyFont*0.7),),
      ],
    );
  }
}
