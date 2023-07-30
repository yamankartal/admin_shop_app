import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/compenent/presentation/widgets/text_form_fieldWidget.dart';
import 'package:shop_admin/core/constants/resposive.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/widgets.dart';
import '../bloc/settings_bloc.dart';
import '../widgets/update_button_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController kilometerPrice = TextEditingController();
  final TextEditingController topSellingLimit = TextEditingController();
  final TextEditingController offerLimit = TextEditingController();
  final TextEditingController deliveryKilometerEarning = TextEditingController();
  final TextEditingController deliveryReward = TextEditingController();
  final TextEditingController ordersRewardNumber = TextEditingController();
  final TextEditingController shopLat = TextEditingController();
  final TextEditingController shopLong = TextEditingController();
  final TextEditingController increasingDeliveryAcceptingPercent = TextEditingController();
  final TextEditingController orderNumberIncreasingAcceptePercent = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey();

  late SettingsBloc settingsBloc;

  @override
  void initState() {
    settingsBloc = BlocProvider.of<SettingsBloc>(context);
    settingsBloc.add(GetSettingsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: BlocConsumer<SettingsBloc, SettingsState>(
        listenWhen: (p,c)=>p.getSettingsState!=c.getSettingsState,
        listener: (_,state){
          if(state.getSettingsState==States.loaded){
            kilometerPrice.text=state.settings.kilometerPrice.toString();
            topSellingLimit.text=state.settings.topSellingLimit.toString();
            offerLimit.text=state.settings.offerLimit.toString();
            deliveryKilometerEarning.text=state.settings.deliveryKilometerEarning.toString();
            deliveryReward.text=state.settings.deliveryReward.toString();
            ordersRewardNumber.text=state.settings.ordersRewardNumber.toString();
            shopLat.text=state.settings.shopLat.toString();
            shopLong.text=state.settings.shopLong.toString();
            increasingDeliveryAcceptingPercent.text=state.settings.increasingDeliveryAcceptingPercent.toString();
            orderNumberIncreasingAcceptePercent.text=state.settings.orderNumberIncreasingAcceptePercent.toString();
          }
        },
        buildWhen: (p, c) => p.getSettingsState != c.getSettingsState,
        builder: (_, state) => builder(
          state.getSettingsState,
          state.errorMsg,
          BlocConsumer<SettingsBloc, SettingsState>(
            listenWhen: (p, c) =>
                p.updateSettingsState != c.updateSettingsState,
            listener: (_, state) {
              if (state.updateSettingsState == States.error) {
                showSnackBar(context, state.errorMsg);
              } else if (state.updateSettingsState == States.loaded) {
                showSnackBar(context, "Setting updated successfully");
              }
            },
            buildWhen: (p, c) => p.updateSettingsState != c.updateSettingsState,
            builder: (_, state) {
              if (state.updateSettingsState == States.loading) {
                return circularProgressIndicatorWidget();
              }
              return SingleChildScrollView(
                padding: EdgeInsets.only(left: Res.font*0.7,top: Res.font,bottom: Res.font),
                child: Column(
                  children: [
                   Form(
                     key: key,
                     child: Column(
                       children: [
                         TextFormFieldWidget(
                           textInputType: TextInputType.phone,
                           label: 'Kilometer Price',
                           hint: '',
                           validate: (String? val) {
                             return val!.isEmpty ? "Empty" : null;
                           },
                           textEditingController: kilometerPrice,
                         ),
                         TextFormFieldWidget(
                           textInputType: TextInputType.phone,
                           label: 'Top Selling Limit',
                           hint: '',
                           validate: (String? val) {
                             return val!.isEmpty ? "Empty" : null;
                           },
                           textEditingController: topSellingLimit,
                         ),
                         TextFormFieldWidget(
                           textInputType: TextInputType.phone,
                           label: 'Offer Limit',
                           hint: '',
                           validate: (String? val) {
                             return val!.isEmpty ? "Empty" : null;
                           },
                           textEditingController: offerLimit,
                         ),
                         TextFormFieldWidget(
                           textInputType: TextInputType.phone,
                           label: 'Delivery Kilometer Earning',
                           hint: '',
                           validate: (String? val) {
                             return val!.isEmpty ? "Empty" : null;
                           },
                           textEditingController: deliveryKilometerEarning,
                         ),
                         TextFormFieldWidget(
                           textInputType: TextInputType.phone,
                           label: 'Delivery Reward',
                           hint: '',
                           validate: (String? val) {
                             return val!.isEmpty ? "Empty" : null;
                           },
                           textEditingController: deliveryReward,
                         ),
                         TextFormFieldWidget(
                           textInputType: TextInputType.phone,
                           label: 'Orders Reward Number',
                           hint: '',
                           validate: (String? val) {
                             return val!.isEmpty ? "Empty" : null;
                           },
                           textEditingController: ordersRewardNumber,
                         ),
                         TextFormFieldWidget(
                           textInputType: TextInputType.phone,
                           label: 'Shop Lat',
                           hint: '',
                           validate: (String? val) {
                             return val!.isEmpty ? "Empty" : null;
                           },
                           textEditingController: shopLat,
                         ),
                         TextFormFieldWidget(
                           textInputType: TextInputType.phone,
                           label: 'Shop Long',
                           hint: '',
                           validate: (String? val) {
                             return val!.isEmpty ? "Empty" : null;
                           },
                           textEditingController: shopLong,
                         ),
                         TextFormFieldWidget(
                           textInputType: TextInputType.phone,
                           label: 'Increasing Accepting Percent',
                           hint: '',
                           validate: (String? val) {
                             return val!.isEmpty ? "Empty" : null;
                           },
                           textEditingController: increasingDeliveryAcceptingPercent,
                         ),
                         TextFormFieldWidget(
                           textInputType: TextInputType.phone,
                           label: 'Orders Reward Number',
                           hint: '',
                           validate: (String? val) {
                             return val!.isEmpty ? "Empty" : null;
                           },
                           textEditingController:
                           orderNumberIncreasingAcceptePercent,
                         ),
                       ],
                     ),
                   )
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: UpdateSettingsButtonWidget(
        onPressed: () {
          if (key.currentState!.validate()) {
            print(0);
            settingsBloc.add(
              UpdateSettingsEvent(
                double.parse(
                  kilometerPrice.text,
                ),
                int.parse(topSellingLimit.text),
                int.parse(offerLimit.text),
                double.parse(deliveryKilometerEarning.text),
                double.parse(deliveryReward.text),
                int.parse(ordersRewardNumber.text),
                double.parse(shopLat.text),
                double.parse(shopLong.text),
                int.parse(increasingDeliveryAcceptingPercent.text),
                int.parse(orderNumberIncreasingAcceptePercent.text),
              ),
            );
          }
        },
      ),
    );
  }
}
