import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/core/constants/colors.dart';
import 'package:shop_admin/core/constants/convert.dart';
import 'package:shop_admin/features/deliveries_feature/presentation/bloc/deliveries_bloc.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/resposive.dart';
import '../../../../core/constants/widgets.dart';
import '../widgets/banned_delivery_widget.dart';
import '../widgets/bottom_button_widget.dart';
import '../widgets/delivery_details_widget.dart';
import '../widgets/delivery_form_widget.dart';


class DeliveryDetailsScreen extends StatefulWidget {
  final int index;

  const DeliveryDetailsScreen({Key? key, required this.index})
      : super(key: key);

  @override
  State<DeliveryDetailsScreen> createState() => _DeliveryDetailsScreenState();
}

class _DeliveryDetailsScreenState extends State<DeliveryDetailsScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey();

  late DeliveriesBloc deliveriesBloc;

  @override
  void initState() {
    deliveriesBloc = BlocProvider.of<DeliveriesBloc>(context);
    deliveriesBloc.add(GetDeliveryDetailsEvent(widget.index));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(
                      "Are you sure you want to delete this delivery ?",
                      style: TextStyle(height: Res.tinyFont * 0.7),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "No",
                          style: TextStyle(
                              color: AppColor.primaryColors,
                              fontWeight: FontWeight.bold,
                              fontSize: Res.font * 0.9),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          deliveriesBloc.add(DeleteDeliveryEvent(widget.index));
                        },
                        child: Text(
                          "Yes",
                          style: TextStyle(
                              color: AppColor.primaryColors,
                              fontWeight: FontWeight.bold,
                              fontSize: Res.font * 0.9),
                        ),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete_outline_rounded))
        ],
        title: const Text("Delivery Details"),
      ),
      body: BlocConsumer<DeliveriesBloc, DeliveriesState>(
        listener: (_, state) {
          if (state.getDeliveryDetailsState == States.loaded) {
            name.text = state.deliveryDetails.deliveryName!;
            email.text = state.deliveryDetails.deliveryEmail!;
            phone.text = state.deliveryDetails.deliveryPhone.toString();
          }
        },
        listenWhen: (p, c) =>
            p.getDeliveryDetailsState != c.getDeliveryDetailsState,
        buildWhen: (p, c) =>
            p.getDeliveryDetailsState != c.getDeliveryDetailsState,
        builder: (_, state) => builder(
          state.getDeliveryDetailsState,
          state.errorMsg,
          BlocConsumer<DeliveriesBloc, DeliveriesState>(
            listenWhen: (p, c) =>
                p.updateDeliveryDetailsState != c.updateDeliveryDetailsState ||
                p.bannedDeliveryState != c.bannedDeliveryState ||
                p.unBannedDeliveryState != c.unBannedDeliveryState ||
                p.deleteDeliveryState != c.deleteDeliveryState ||
                p.deleteDeliveryState != c.deleteDeliveryState,
            listener: (_, state) {
              if (state.updateDeliveryDetailsState == States.error ||
                  state.bannedDeliveryState == States.error ||
                  state.unBannedDeliveryState == States.error ||
                  state.deleteDeliveryState == States.error) {
                showSnackBar(context, state.errorMsg);
              } else if (state.updateDeliveryDetailsState == States.loaded) {
                Navigator.of(context).pop();
              } else if (state.deleteDeliveryState == States.loaded) {
                Navigator.of(context).pop();
              } else if (state.bannedDeliveryState == States.loaded) {
                showSnackBar(context, "Delivery has been banned");
              } else if (state.unBannedDeliveryState == States.loaded) {
                showSnackBar(context, "Delivery has been Un banned");
              }
            },
            buildWhen: (p, c) =>
                p.updateDeliveryDetailsState != c.updateDeliveryDetailsState ||
                p.bannedDeliveryState != c.bannedDeliveryState ||
                p.unBannedDeliveryState != c.unBannedDeliveryState ||
                p.deleteDeliveryState != c.deleteDeliveryState ||
                p.deleteDeliveryState != c.deleteDeliveryState,
            builder: (_, state) {
              if (state.updateDeliveryDetailsState == States.loading ||
                  state.bannedDeliveryState == States.loading ||
                  state.unBannedDeliveryState == States.loading ||
                  state.deleteDeliveryState == States.loading) {
                return circularProgressIndicatorWidget();
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    BannedDeliveryWidget(
                      onChanged: (bool value) {
                        if (value == false) {
                          deliveriesBloc
                              .add(UnBannedDeliveryEvent(widget.index));
                        } else {
                          deliveriesBloc.add(BannedDeliveryEvent(widget.index));
                        }
                      },
                      deliveryDetailsModel: state.deliveryDetails,
                    ),
                    DeliveryFormWidget(
                      formKey: key,
                      name: name,
                      email: email,
                      phone: phone,
                    ),
                    DeliveryDetailsWidget(
                      trailing: state.deliveryDetails.deliveryId.toString(),
                      label: 'Number',
                    ),
                    DeliveryDetailsWidget(
                      trailing:
                          state.deliveryDetails.deliveryOrdersCount.toString(),
                      label: 'Total Orders Done',
                    ),
                    DeliveryDetailsWidget(
                      trailing: convertIntoDeliveryStage(
                          state.deliveryDetails.deliveryOrderStage),
                      label: 'Stage',
                    ),
                    DeliveryDetailsWidget(
                      trailing: convertIntoDeliveryStatus(
                          state.deliveryDetails.deliveryStatus),
                      label: 'Status',
                    ),
                    DeliveryDetailsWidget(
                      trailing:
                          state.deliveryDetails.deliveryVerifyCode.toString(),
                      label: 'Verify Code',
                    ),
                    DeliveryDetailsWidget(
                      trailing:
                          "${state.deliveryDetails.deliveryAcceptingPercent}%",
                      label: 'Accepting Percent',
                    ),
                    DeliveryDetailsWidget(
                      trailing: convertIntoDeliveryApprove(
                          state.deliveryDetails.deliveryApprove),
                      label: 'Approve',
                    ),
                    DeliveryDetailsWidget(
                      trailing: "${state.deliveryDetails.deliveryBalance} \$",
                      label: 'Balance',
                    ),
                    DeliveryDetailsWidget(
                      trailing:
                          "${state.deliveryDetails.deliveryCreateTime!.year}/${state.deliveryDetails.deliveryCreateTime!.month}/${state.deliveryDetails.deliveryCreateTime!.day}",
                      label: 'Create Time',
                    ),
                    DeliveryDetailsWidget(
                      trailing:
                          "${state.deliveryDetails.deliveryCancelingPercent}%",
                      label: 'Canceling Percent',
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: ButtomButtonWidget(
        label: "Done",
        onPressed: () {
          deliveriesBloc.add(
            UpdateDeliveryEvent(
                name.text, email.text, int.parse(phone.text), widget.index),
          );
        },
      ),
    );
  }
}
