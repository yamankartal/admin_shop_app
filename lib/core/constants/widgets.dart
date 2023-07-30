import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/core/constants/constants.dart';
import 'package:shop_admin/core/constants/resposive.dart';
import 'package:shop_admin/features/categories_feature/presentation/bloc/categories_bloc.dart';
import 'package:shop_admin/features/products_feature/presentation/bloc/products_bloc.dart';

import '../../features/categories_feature/presentation/screens/categories_screen.dart';
import '../../features/deliveries_feature/presentation/bloc/deliveries_bloc.dart';
import '../../features/deliveries_feature/presentation/screens/deliveries_screen.dart';
import '../../features/orders_feature/presentation/screens/archived_orders_screen.dart';
import '../../features/orders_feature/presentation/screens/orders_page.dart';
import '../../features/products_feature/presentation/screens/products_screen.dart';
import '../../features/report_feature/presentation/bloc/report_bloc.dart';
import '../../features/report_feature/presentation/screens/report_screen.dart';
import '../../features/settings_feature/presentation/bloc/settings_bloc.dart';
import '../../features/settings_feature/presentation/screens/settings_screen.dart';
import '../../features/users_feature/presentation/bloc/users_bloc.dart';
import '../../features/users_feature/presentation/screens/users_screen.dart';
import '../../injection.dart';
import 'colors.dart';
import 'enums.dart';

Widget circularProgressIndicatorWidget() {
  return const Center(
      child: CircularProgressIndicator(
    color: AppColor.primaryColors,
  ));
}

Widget errorWidget(String errorMsg) {
  return Center(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: Res.padding * 0.5),
      child: Text(
        errorMsg,
        style: TextStyle(
            color: AppColor.primaryColors,
            fontSize: Res.font * 1.2,
            fontWeight: FontWeight.bold,
            height: Res.tinyFont * 0.8),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

showSnackBar(context, text, [tex2]) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Res.padding)),
      backgroundColor: Colors.black87.withOpacity(0.8),
      margin: EdgeInsets.symmetric(horizontal: Res.font, vertical: Res.font),
      behavior: SnackBarBehavior.floating,
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Res.padding),
        ),
        child: tex2 == null
            ? Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: Res.font * 0.7),
              )
            : Column(
                children: [
                  Text(text),
                  Text(tex2),
                ],
              ),
      )));
}

List<HomeModel> homeList = [
  HomeModel(
    "assets/images/application.png",
    "Categories",
    () {
      Navigator.of(navigatorKey.currentState!.context).push(
        MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<CategoriesBloc>(),
            child: const CategoriesScreen(),
          ),
        ),
      );
    },
  ),
  HomeModel(
    "assets/images/archive.png",
    "Archive",
    () {
      Navigator.of(navigatorKey.currentState!.context).push(
        MaterialPageRoute(
          builder: (_) => const ArchivedOrdersScreen(),
        ),
      );
    },
  ),
  HomeModel(
    "assets/images/box.png",
    "Products",
    () {
      Navigator.of(navigatorKey.currentState!.context).push(
        MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<ProductsBloc>(),
            child: const ProductsScreen(),
          ),
        ),
      );
    },
  ),
  HomeModel(
    "assets/images/completed-task.png",
    "Orders",
    () {
      Navigator.of(navigatorKey.currentState!.context)
          .push(
            MaterialPageRoute(
              builder: (_) => const OrdersPage(),
            ),
          )
          .then((value) => screen = Screen.other);
    },
  ),
  HomeModel(
    "assets/images/delivery (1).png",
    "Deliveries",
    () {
      Navigator.of(navigatorKey.currentState!.context).push(
        MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<DeliveriesBloc>(),
            child: const DeliveriesScreen(),
          ),
        ),
      );
    },
  ),
  HomeModel(
    "assets/images/report.png",
    "Report",
    () {
      Navigator.of(navigatorKey.currentState!.context).push(
        MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<ReportBloc>(),
            child: const ReportScreen(),
          ),
        ),
      );
    },
  ),
  HomeModel(
    "assets/images/gear.png",
    "Settings",
    () {
      Navigator.of(navigatorKey.currentState!.context).push(
        MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<SettingsBloc>(),
            child: const SettingsScreen(),
          ),
        ),
      );
    },
  ),
  HomeModel(
    "assets/images/man.png",
    "Users",
    () {
      Navigator.of(navigatorKey.currentState!.context).push(
        MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<UsersBloc>(),
            child: const UsersScreen(),
          ),
        ),
      );
    },
  ),
];


class HomeModel {
  final String image;
  final String label;
  final Function() function;

  HomeModel(this.image, this.label, this.function);
}

Widget builder(States state, errorMsg, Widget widget) {
  if (state == States.loading) {
    return circularProgressIndicatorWidget();
  } else if (state == States.loaded) {
    return widget;
  } else if (state == States.error) {
    return errorWidget(errorMsg);
  }
  return Container();
}
