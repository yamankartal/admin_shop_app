import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_admin/core/constants/colors.dart';

import '../../../../core/constants/resposive.dart';

class DeliveryDetailsWidget extends StatelessWidget {
 final String label;
 final String trailing;
  const DeliveryDetailsWidget({Key? key, required this.label, required this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: EdgeInsets.symmetric(horizontal: Res.font*0.8),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,style: TextStyle(fontSize: Res.font*0.9,color:Colors.black.withOpacity(0.8),height: Res.tinyFont*0.8,fontWeight: FontWeight.bold),),
            Text(trailing,style: TextStyle(fontSize: Res.font*0.9,height: Res.tinyFont*0.8,color: AppColor.primaryColors),),
          ],
        ),
        const Divider(color: Colors.grey,),
      ],
    ),
    );
  }
}
