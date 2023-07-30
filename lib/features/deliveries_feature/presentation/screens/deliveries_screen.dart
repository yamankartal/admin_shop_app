import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/core/constants/convert.dart';
import 'package:shop_admin/features/deliveries_feature/data/model/delivery_model.dart';
import 'package:shop_admin/features/deliveries_feature/presentation/bloc/deliveries_bloc.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/resposive.dart';
import '../../../../core/constants/widgets.dart';
import '../widgets/add_delivery_button_Widget.dart';
import '../widgets/delivery_item_widget.dart';
import 'add_delivery_screen.dart';
import 'delivery_details_screen.dart';

class DeliveriesScreen extends StatefulWidget {
  const DeliveriesScreen({Key? key}) : super(key: key);

  @override
  State<DeliveriesScreen> createState() => _DeliveriesScreenState();
}

class _DeliveriesScreenState extends State<DeliveriesScreen> {
  late DeliveriesBloc deliveriesBloc;

  @override
  void initState() {
    deliveriesBloc = BlocProvider.of<DeliveriesBloc>(context);
    deliveriesBloc.add(GetDeliveriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deliveries"),
      ),
      body: BlocBuilder<DeliveriesBloc, DeliveriesState>(
        buildWhen: (p, c) => p.getDeliveriesState != c.getDeliveryDetailsState,
        builder: (_, state) {
          return builder(
            state.getDeliveriesState,
            state.errorMsg,
            BlocConsumer<DeliveriesBloc, DeliveriesState>(
              listenWhen: (p, c) =>
                  p.deleteDeliveryState != c.deleteDeliveryState,
              listener: (_, state) {
                if (state.deleteDeliveryState == States.error) {
                  showSnackBar(context, state.errorMsg);
                }
              },
              buildWhen: (p, c) =>
                  p.deleteDeliveryState != c.deleteDeliveryState ||
                  p.updateDeliveryDetailsState !=
                      c.updateDeliveryDetailsState ||
                  p.addDeliveryState != c.addDeliveryState,
              builder: (_, state) {
                if (state.deleteDeliveryState == States.loading) {
                  return circularProgressIndicatorWidget();
                }
                return ListView.separated(
                    padding: EdgeInsets.symmetric(
                        vertical: Res.padding, horizontal: Res.padding),
                    itemBuilder: (_, index) {
                      final DeliveryModel deliveryModel =
                          state.deliveries[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                value: deliveriesBloc,
                                child: DeliveryDetailsScreen(
                                  index: index,
                                ),
                              ),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(Res.padding)),
                          elevation: Res.padding,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: Res.font * 0.8,
                                horizontal: Res.padding),
                            child: Column(
                              children: [
                                DeliveryItemWidget(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  label: 'Delivery Number : ',
                                  trailing: state.deliveries[index].deliveryId
                                      .toString(),
                                ),
                                DeliveryItemWidget(
                                  label: 'Delivery Name : ',
                                  trailing: state.deliveries[index].deliveryName
                                      .toString(),
                                ),
                                DeliveryItemWidget(
                                  label: 'Delivery Phone : ',
                                  trailing: state
                                      .deliveries[index].deliveryPhone
                                      .toString(),
                                ),
                                DeliveryItemWidget(
                                  label: 'Delivery Status : ',
                                  trailing: convertIntoDeliveryStatus(
                                      state.deliveries[index].deliveryStatus),
                                ),
                                DeliveryItemWidget(
                                  label: 'Delivery Banned : ',
                                  trailing: convertIntoDeliveryBanned(
                                      state.deliveries[index].deliveryBanned),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) => SizedBox(
                          height: Res.padding,
                        ),
                    itemCount: state.deliveries.length);
              },
            ),
          );
        },
      ),
      floatingActionButton: AddDeliveryButtonWidget(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: deliveriesBloc,
                child: const AddDeliveryScreen(),
              ),
            ),
          );
        },
      ),
    );
  }
}
