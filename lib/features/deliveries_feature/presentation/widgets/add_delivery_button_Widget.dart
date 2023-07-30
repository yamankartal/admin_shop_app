import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/resposive.dart';
import '../screens/add_delivery_screen.dart';

class AddDeliveryButtonWidget extends StatelessWidget {
  final Function() onPressed;
  const AddDeliveryButtonWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: AppColor.primaryColors,
      child: Icon(
        Icons.add,
        size: Res.font * 1.2,
      ),
    );
  }
}
