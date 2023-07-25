import 'package:flutter/material.dart';
import 'package:shop_admin/core/constants/constants.dart';
import 'package:shop_admin/features/splash_feature/screens/splash_screen.dart';

import '../../../../features/home_feature/presentation/screens/home_screen.dart';
import '../../../../features/orders_feature/presentation/screens/orders_page.dart';
import '../../../constants/colors.dart';
import '../../../constants/resposive.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       navigatorKey:navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: AppColor.primaryColors,
            titleTextStyle: TextStyle(fontSize: Res.font)),
        primaryColor: AppColor.primaryColors,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: Res.font,
            color: Colors.black,
          ),
          bodyText2: TextStyle(fontSize: Res.font * 0.8, color: Colors.black),
        ),
      ),
      home:const HomeScreen(),
    );
  }
}
