import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/core/constants/colors.dart';
import 'package:shop_admin/core/constants/constants.dart';
import 'package:shop_admin/features/orders_feature/presentation/bloc/orders_bloc.dart';

import '../../../../core/constants/resposive.dart';
import '../../../../core/constants/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 @override
  void initState() {
   listenToNotification(BlocProvider.of<OrdersBloc>(context));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    responsive(context);
    return Scaffold(
      body: Column(
        children: [
          Text(
            "DashBoard",
            style: TextStyle(
                color: AppColor.primaryColors,
                fontSize: Res.font * 1.5,
                fontWeight: FontWeight.bold,
                height: Res.tinyFont*1.2),
          ),
          Expanded(child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: Res.padding,vertical:0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,
                  crossAxisSpacing: Res.padding*0.7,
                  mainAxisSpacing: Res.padding,
                  mainAxisExtent: Res.height*0.2
              ),
              itemBuilder: (_, index) => InkWell(
                onTap: (){
                  homeList[index].function();
                },
                child: Card(
                    elevation: Res.padding,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Res.padding)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Res.padding,),
                      child:Column(
                        children: [
                          SizedBox(height: Res.padding,),
                          Image.asset(homeList[index].image,height: Res.height*0.1,),
                          Text(homeList[index].label,style: TextStyle(height: Res.tinyFont*0.8,fontSize: Res.font*0.9,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    )
                ),
              ),
              itemCount: homeList.length),)
        ],
      )
    );
  }
}
