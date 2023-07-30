import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/core/constants/constants.dart';
import 'package:shop_admin/features/orders_feature/presentation/bloc/orders_bloc.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/resposive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    responsive(context);
    listenToNotification(BlocProvider.of<OrdersBloc>(context));
  return Scaffold(
        body: Container(
          color: AppColor.primaryColors,
          width: Res.width,
          height: Res.fullHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: Res.height * 0.6,
                width: Res.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/logoapp.png',
                        ))),
              ),
            ],
          ),
        ),
    );
  }
}
