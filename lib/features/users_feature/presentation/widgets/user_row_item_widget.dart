import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_admin/core/constants/colors.dart';

import '../../../../core/constants/resposive.dart';

class UserRowItemWidget extends StatelessWidget {

  final String label;
  final String trailing;

  const UserRowItemWidget({Key? key, required this.label, required this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DefaultTextStyle(style: TextStyle(color: Colors.black,fontSize: Res.font*0.9,height: Res.tinyFont*0.8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Expanded(child: Text(trailing,style: const TextStyle(color: AppColor.primaryColors),),)
      ],

    ));
  }
}
