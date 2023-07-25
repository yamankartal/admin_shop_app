import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/core/constants/convert.dart';
import 'package:shop_admin/core/constants/widgets.dart';
import 'package:shop_admin/features/orders_feature/data/model/order_details_model.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/resposive.dart';
import '../bloc/orders_bloc.dart';
import '../widgets/order_details_text_widget.dart';

class OrderDetailsScreen extends StatefulWidget {
  final int orderId;

  const OrderDetailsScreen({Key? key, required this.orderId}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {

  late OrdersBloc ordersBloc;

  @override
  void initState() {
    ordersBloc = BlocProvider.of<OrdersBloc>(context);
    ordersBloc.add(GetOrderDetailsEvent(widget.orderId));
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body:BlocBuilder<OrdersBloc,OrdersState>(
        buildWhen: (p,c)=>p.getOrderDetailsState!=c.getOrderDetailsState,
        builder: (_,state){
          if(state.getOrderDetailsState==States.loading){
            return circularProgressIndicatorWidget();
          }

          else if(state.getOrderDetailsState==States.loaded){
            final OrderDetailsModel orderDetails=state.orderDetails;
            return  SingleChildScrollView(
              child:Padding(
                padding: EdgeInsets.symmetric(vertical: Res.font,horizontal: Res.font*0.7),
                child: Column(
                    children:[
                      Row(
                        children: [
                          Text("User Details :",style: TextStyle(color: Colors.black,fontSize: Res.font,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: Res.padding,),
                      OrderDetailsTextWidget(label: 'Name',trailing: orderDetails.userName.toString()),
                      OrderDetailsTextWidget(label: 'Distance',trailing: "${orderDetails.orderDistance} Km"),
                      OrderDetailsTextWidget(label: 'city',trailing: orderDetails.addressCity.toString()),
                      OrderDetailsTextWidget(label: 'phone',trailing: orderDetails.addressPhone.toString()),
                      OrderDetailsTextWidget(label: 'street',trailing: orderDetails.addressStreet.toString()),
                      SizedBox(height: Res.padding,),
                      Row(
                        children: [
                          Text("Order Details :",style: TextStyle(color: Colors.black,fontSize: Res.font,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: Res.padding,),
                      OrderDetailsTextWidget(label: 'order id',trailing: orderDetails.orderId.toString()),
                      OrderDetailsTextWidget(label: 'order price',trailing: "${orderDetails.orderPrice} \$"),
                      OrderDetailsTextWidget(label: 'Delivery price',trailing: "${orderDetails.orderDeliveryPrice} \$"),
                      OrderDetailsTextWidget(label: 'total price',trailing: "${orderDetails.orderTotalPrice} \$"),
                      OrderDetailsTextWidget(label: 'order rating',trailing: "${orderDetails.orderRating} stars"),
                      OrderDetailsTextWidget(label: 'order type',trailing:convertIntoOrderType(orderDetails.orderType)),
                      OrderDetailsTextWidget(label: 'payment methode',trailing:convertIntoPaymentMethode( orderDetails.orderPaymentMethode)),
                      SizedBox(height: Res.padding,),
                      Row(
                        children: [
                          Text("Delivery Details :",style: TextStyle(color: Colors.black,fontSize: Res.font,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      OrderDetailsTextWidget(label: 'phone',trailing: orderDetails.deliveryPhone.toString()),
                      OrderDetailsTextWidget(label: 'name',trailing: orderDetails.deliveryName.toString()),
                      SizedBox(height: Res.padding,),
                      if(orderDetails.coupon!=null)
                        Column(
                          children: [
                            Row(
                              children: [
                                Text("Coupon Details :",style: TextStyle(color: Colors.black,fontSize: Res.font,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            SizedBox(height: Res.padding,),
                            OrderDetailsTextWidget(label: 'name',trailing: orderDetails.coupon!.couponName.toString()),
                            OrderDetailsTextWidget(label: 'discount',trailing: "${orderDetails.couponDiscount()!} \$"),
                          ],
                        )
                    ]
                )
              ),
            );
          }

          else if(state.getOrderDetailsState==States.error){
            return errorWidget(state.errorMsg);
          }
          return Container();
        },
      )
    );
  }
}
