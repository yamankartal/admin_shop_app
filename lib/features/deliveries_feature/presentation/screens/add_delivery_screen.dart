import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/features/deliveries_feature/presentation/bloc/deliveries_bloc.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/resposive.dart';
import '../../../../core/constants/widgets.dart';
import '../widgets/bottom_button_widget.dart';
import '../widgets/delivery_form_widget.dart';

class AddDeliveryScreen extends StatefulWidget {
  const AddDeliveryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddDeliveryScreen> createState() => _AddDeliveryScreenState();
}

class _AddDeliveryScreenState extends State<AddDeliveryScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey();

  late DeliveriesBloc deliveriesBloc;

  @override
  void initState() {
    deliveriesBloc = BlocProvider.of<DeliveriesBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Delivery"),
      ),
      body: BlocBuilder<DeliveriesBloc, DeliveriesState>(
        buildWhen: (p, c) =>
            p.getDeliveryDetailsState != c.getDeliveryDetailsState,
        builder: (_, state) => builder(
          state.getDeliveryDetailsState,
          state.errorMsg,
          BlocConsumer<DeliveriesBloc, DeliveriesState>(
            listenWhen: (p, c) => p.addDeliveryState != c.addDeliveryState,
            listener: (_, state) {
              if (state.addDeliveryState == States.error) {
                showSnackBar(context, state.errorMsg);
              } else if (state.addDeliveryState == States.loaded) {
                Navigator.of(context).pop();
              }
            },
            buildWhen: (p, c) => p.addDeliveryState != c.addDeliveryState,
            builder: (_, state) {
              if (state.addDeliveryState == States.loading) {
                return circularProgressIndicatorWidget();
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Res.padding, horizontal: Res.padding),
                  child: Column(
                    children: [
                      DeliveryFormWidget(
                        formKey: key,
                        name: name,
                        email: email,
                        phone: phone,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: ButtomButtonWidget(
        label: "Done",
        onPressed: () {
          if (key.currentState!.validate()) {
            deliveriesBloc.add(
              AddDeliveryEvent(
                name.text,
                email.text,
                int.parse(phone.text),
              ),
            );
          }
        },
      ),
    );
  }
}
