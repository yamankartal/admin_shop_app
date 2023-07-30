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

class ArchivedOrdersScreen extends StatefulWidget {
  const ArchivedOrdersScreen({Key? key}) : super(key: key);

  @override
  State<ArchivedOrdersScreen> createState() => _ArchivedOrdersScreenState();
}

class _ArchivedOrdersScreenState extends State<ArchivedOrdersScreen> {
  late OrdersBloc ordersBloc;

  @override
  void initState() {
    ordersBloc = BlocProvider.of<OrdersBloc>(context);
    ordersBloc.add(GetArchivedOrdersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      buildWhen: (p, c) => p.getOrdersState != c.getOrdersState,
      builder: (_, state) {
        if (state.getOrdersState == States.loading) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Archive"),
            ),
            body: circularProgressIndicatorWidget(),
          );
        } else if (state.getOrdersState == States.loaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Archive"),
            ),
            body: RefreshIndicator(
              color: AppColor.primaryColors,
              onRefresh: () async {
                ordersBloc.add(GetArchivedOrdersEvent());
              },
              child: state.orders.isEmpty
                  ? errorWidget("No Pending orders")
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(
                          vertical: Res.font, horizontal: Res.font),
                      itemBuilder: (_, index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => OrderDetailsScreen(
                                orderId: state.orders[index].orderId!,
                              ),
                            ),
                          );
                        },
                          child: OrderItemWidget(
                            orderModel: state.orders[index],
                            ordersBloc: ordersBloc,
                            index: index,
                            fromScreen: FromScreen.archivedOrders,
                          ),
                      ),
                      separatorBuilder: (_, index) => SizedBox(
                        height: Res.font,
                      ),
                      itemCount: state.orders.length,
                    ),
            ),
          );
        } else if (state.getOrdersState == States.error) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Archive"),
            ),
            body: errorWidget(state.errorMsg),
          );
        }

        return Container();
      },
    );
  }
}
