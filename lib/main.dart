import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/features/orders_feature/presentation/bloc/orders_bloc.dart';
import 'core/app_feature/presentation/screens/initial_screen.dart';
import 'injection.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(BlocProvider(create: (_)=>sl<OrdersBloc>(),
  child:const InitialScreen()
  ),
  );
}
