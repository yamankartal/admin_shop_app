import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/core/constants/constants.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/pages.dart';
import '../../../../core/constants/resposive.dart';
import '../bloc/orders_bloc.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  late OrdersBloc ordersBloc;

  @override
  void initState() {
    ordersBloc = BlocProvider.of<OrdersBloc>(context);
    listenToNotification(ordersBloc);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    responsive(context);
    return BlocBuilder<OrdersBloc, OrdersState>(
      buildWhen: (p, c) => p.index != c.index,
      builder: (_, state) => Scaffold(
        body: Column(
          children: [
            SizedBox(height: Res.height*0.07,),
            DefaultTextStyle(style: TextStyle(
              fontSize: Res.font,fontWeight: FontWeight.bold,color: AppColor.primaryColors
            ), child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Res.font*0.8),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: Res.height*0.06,
                    child: Column(
                      children: [
                        Text("Pending"),
                        if(state.index==0)
                          Container(
                            width: Res.width * 0.22,
                            height: Res.tinyFont,
                            color: AppColor.primaryColors,
                            margin: EdgeInsets.only(top: Res.padding*0.8),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    height: Res.height*0.06,
                    child: Column(
                      children: [
                        Text("Accepted"),
                        if(state.index==1)
                          Container(
                            width: Res.width * 0.25,
                            height: Res.tinyFont,
                            color: AppColor.primaryColors,
                            margin: EdgeInsets.only(top: Res.padding*0.8),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    height: Res.height*0.06,
                    child: Column(
                      children: [
                        Text("Active"),
                        if(state.index==2)
                          Container(
                            width: Res.width * 0.17,
                            height: Res.tinyFont,
                            color: AppColor.primaryColors,
                            margin: EdgeInsets.only(top: Res.padding*0.8),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            )
            ),
            Expanded(
              child: PageView.builder(
                  onPageChanged: (index) {
                    ordersBloc.add(ChangePageViewIndexEvent(index));
                  },
                  itemBuilder: (_, index) => ordersPages[state.index],
                  itemCount: ordersPages.length),
            )
          ],
        ),
      ),
    );
  }
}
