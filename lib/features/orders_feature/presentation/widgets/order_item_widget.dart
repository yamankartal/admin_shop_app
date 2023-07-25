import 'package:flutter/material.dart';
import 'package:shop_admin/core/constants/enums.dart';
import 'package:shop_admin/features/orders_feature/data/model/order_model.dart';
import 'package:shop_admin/features/orders_feature/presentation/bloc/orders_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/constants/resposive.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderModel orderModel;
  final int index;
  final OrdersBloc ordersBloc;
  final FromScreen fromScreen;

  const OrderItemWidget(
      {Key? key,
      required this.orderModel,
      required this.index,
      required this.ordersBloc,
      this.fromScreen=FromScreen.other
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: Res.padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Res.padding),
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Res.padding, vertical: Res.font),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Order number : ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: Res.font,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  orderModel.orderId.toString(),
                  style: TextStyle(
                      color: AppColor.primaryColors,
                      fontSize: Res.font,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: Res.padding,
            ),
            Row(
              children: [
                Text(
                  "Order Receive Time : ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: Res.font,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "${time(orderModel.orderDateTime!.hour)}:${time(orderModel.orderDateTime!.minute)}",
                  style: TextStyle(
                      color: AppColor.primaryColors,
                      fontSize: Res.font,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            if(fromScreen!=FromScreen.archivedOrders)
            Column(
              children: [
                SizedBox(
                  height: Res.padding,
                ),
                Row(
                  mainAxisAlignment:fromScreen==FromScreen.pending?MainAxisAlignment.spaceBetween: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      minWidth: Res.width * 0.4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Res.padding),
                      ),
                      color: AppColor.primaryColors,
                      onPressed: () {
                        ordersBloc.add(
                          DeleteOrderEvent(index),
                        );
                      },
                      child: Text(
                        "Delete",
                        style: TextStyle(
                            color: Colors.white, fontSize: Res.font * 0.8),
                      ),
                    ),
                    if(fromScreen==FromScreen.pending)
                      MaterialButton(
                        minWidth: Res.width*0.4,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(Res.padding)),
                        color: AppColor.primaryColors,
                        onPressed: () {
                          ordersBloc.add(ApproveOrderEvent(index));
                        },
                        child: Text(
                          "Accepte",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Res.font * 0.8),
                        ),
                      ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
