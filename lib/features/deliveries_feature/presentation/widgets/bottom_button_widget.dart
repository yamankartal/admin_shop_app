import 'package:flutter/material.dart';
import 'package:shop_admin/core/constants/colors.dart';

import '../../../../core/constants/resposive.dart';

class ButtomButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String label;
  const ButtomButtonWidget({Key? key, required this.onPressed, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: Res.font*2,
        color: AppColor.primaryColors,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Res.padding),
            topRight: Radius.circular(Res.padding),
          )
        ),
        onPressed:onPressed,
    child: Text(label,style: TextStyle(color: Colors.white,fontSize: Res.font),),
    );
  }
}
