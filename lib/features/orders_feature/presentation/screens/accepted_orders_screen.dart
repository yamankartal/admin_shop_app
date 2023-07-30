import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/resposive.dart';
import '../../../../core/constants/widgets.dart';
import '../bloc/orders_bloc.dart';
import '../widgets/order_item_widget.dart';
import 'order_details_screen.dart';

class AcceptedOrdersScreen extends StatefulWidget {
  const AcceptedOrdersScreen({Key? key}) : super(key: key);

  @override
  State<AcceptedOrdersScreen> createState() => _AcceptedOrdersScreenState();
}

class _AcceptedOrdersScreenState extends State<AcceptedOrdersScreen> {
  late OrdersBloc ordersBloc;

  @override
  void initState() {
    screen = Screen.accepted;
    ordersBloc = BlocProvider.of<OrdersBloc>(context);
    ordersBloc.add(GetAcceptedOrdersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      buildWhen: (p, c) => p.getOrdersState != c.getOrdersState,
      builder: (_, state) {
        if (state.getOrdersState == States.loading) {
          return circularProgressIndicatorWidget();
        } else if (state.getOrdersState == States.loaded) {
          return BlocConsumer<OrdersBloc, OrdersState>(
            listenWhen: (p, c) => p.deleteOrderState != c.deleteOrderState,
            buildWhen: (p, c) => p.deleteOrderState != c.deleteOrderState,
            builder: (_, state) {
              if (state.deleteOrderState == States.loading) {
                return circularProgressIndicatorWidget();
              }

              return BlocBuilder<OrdersBloc, OrdersState>(
                buildWhen: (p, c) => p.orders != c.orders,
                builder: (_, state) => RefreshIndicator(
                  color: AppColor.primaryColors,
                  child: state.orders.isEmpty
                      ? errorWidget("No Accepted Orders")
                      : ListView.separated(
                          padding: EdgeInsets.symmetric(
                              vertical: Res.font, horizontal: Res.font),
                          itemBuilder: (_, index) => InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => OrderDetailsScreen(
                                            orderId:
                                                state.orders[index].orderId!,
                                          )),
                                );
                              },
                              child: OrderItemWidget(
                                orderModel: state.orders[index],
                                ordersBloc: ordersBloc,
                                index: index,
                              )),
                          separatorBuilder: (_, index) => SizedBox(
                            height: Res.font,
                          ),
                          itemCount: state.orders.length,
                        ),
                  onRefresh: () async {
                    ordersBloc.add(
                      GetAcceptedOrdersEvent(),
                    );
                  },
                ),
              );
            },
            listener: (_, state) {
              if (state.deleteOrderState == States.error) {
                showSnackBar(context, state.errorMsg);
              }
            },
          );
        } else if (state.getOrdersState == States.error) {
          return errorWidget(state.errorMsg);
        }

        return Container();
      },
    );
  }
}
