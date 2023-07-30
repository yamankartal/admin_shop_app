import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_admin/features/users_feature/presentation/widgets/user_row_item_widget.dart';

import '../../../../core/constants/resposive.dart';
import '../../data/model/user_model.dart';

class UserItemWidget extends StatelessWidget {
  final UserModel userModel;
  const UserItemWidget({Key? key, required this.userModel,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: Res.padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Res.padding)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Res.padding,horizontal: Res.padding*0.8),
        child: Column(
          children: [
            UserRowItemWidget(label: "Name : ",trailing: userModel.userName!,),
            UserRowItemWidget(label: "Email : ",trailing: userModel.userEmail!,),
            UserRowItemWidget(label: "phone : ",trailing: userModel.userPhone.toString(),),
            UserRowItemWidget(label: "Create Time : ",trailing: "${userModel.userCreateTime!.year}/${userModel.userCreateTime!.month}/${userModel.userCreateTime!.day}",),
          ],
        ),
      ),
    );
  }
}
