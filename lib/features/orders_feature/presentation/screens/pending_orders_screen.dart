import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/core/constants/colors.dart';
import 'package:shop_admin/core/constants/widgets.dart';
import 'package:shop_admin/features/orders_feature/presentation/bloc/orders_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/resposive.dart';
import '../widgets/order_item_widget.dart';
import 'order_details_screen.dart';

class PendingOrdersScreen extends StatefulWidget {
  const PendingOrdersScreen({Key? key}) : super(key: key);

  @override
  State<PendingOrdersScreen> createState() => _PendingOrdersScreenState();
}

class _PendingOrdersScreenState extends State<PendingOrdersScreen> {
  late OrdersBloc ordersBloc;

  @override
  void initState() {
    screen=Screen.pending;
    ordersBloc = BlocProvider.of<OrdersBloc>(context);
    ordersBloc.add(GetPendingOrdersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc,OrdersState>(
        buildWhen: (p,c)=>p.getOrdersState!=c.getOrdersState,
        builder: (_, state) {

          if(state.getOrdersState==States.loading){
            return circularProgressIndicatorWidget();
          }

          else if(state.getOrdersState==States.loaded){
            return BlocConsumer<OrdersBloc,OrdersState>(
              listenWhen: (p,c)=>p.approveOrderState!=c.approveOrderState,
              buildWhen: (p,c)=>p.approveOrderState!=c.approveOrderState,
              builder: (_,state){
                if(state.approveOrderState==States.loading){
                  return circularProgressIndicatorWidget();
                }


                return BlocBuilder<OrdersBloc,OrdersState>(
                    buildWhen: (p,c)=>p.orders!=c.orders,
                    builder: (_,state)=> RefreshIndicator(
                  color: AppColor.primaryColors,
                  onRefresh: ()async{
                    ordersBloc.add(GetPendingOrdersEvent());
                  },
                  child: state.orders.isEmpty?errorWidget("No Pending orders"):
                  ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: Res.font,horizontal: Res.padding),
                    itemBuilder: (_, index) =>InkWell(
                      onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_)=>OrderDetailsScreen(orderId: state.orders[index].orderId!,)
                          ));
                      },
                        child:OrderItemWidget(orderModel:state.orders[index],ordersBloc: ordersBloc,index: index,fromScreen: FromScreen.pending,)


                    ),
                    separatorBuilder: (_, index) => SizedBox(
                      height: Res.font,
                    ),
                    itemCount:state.orders.length,
                  ),
                ));

              },
              listener: (_,state){
                if(state.deleteOrderState==States.error){
                  showSnackBar(context, state.errorMsg);
                }

              },);
          }

          else if(state.getOrdersState==States.error){
            return errorWidget(state.errorMsg);
          }

          return Container();

        }
    );
  }
}
