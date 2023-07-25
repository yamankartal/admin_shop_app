import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_admin/core/constants/colors.dart';

import '../../../../core/constants/resposive.dart';

class OrderDetailsTextWidget extends StatelessWidget {

  final String label;
  final String trailing;

  const OrderDetailsTextWidget({Key? key, required this.label, required this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,style: TextStyle(color: Colors.black54,fontSize: Res.font,height: Res.tinyFont*0.8),),
        Text(trailing,style: TextStyle(color: AppColor.primaryColors,fontSize: Res.font,height: Res.tinyFont*0.8),),
      ],
    ),
    Divider(thickness: Res.tinyFont,),
      ],
    );
  }
}
