import 'package:flutter/material.dart';
import 'package:shop_admin/core/constants/colors.dart';

import '../../../../core/constants/resposive.dart';

class UpdateSettingsButtonWidget extends StatelessWidget {
  final   Function()onPressed;
  const UpdateSettingsButtonWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColor.primaryColors,
      minWidth: Res.width,
      height: Res.font*2,
      onPressed: onPressed,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Res.padding),
        topRight: Radius.circular(Res.padding),
      ),
    ),
      child: Text("Update",style: TextStyle(color: Colors.white,fontSize: Res.font),),
    );
  }
}
