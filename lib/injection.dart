import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_admin/features/categories_feature/data/repository/repository.dart';
import 'package:shop_admin/features/categories_feature/domain/repository/repository.dart';
import 'package:shop_admin/features/categories_feature/domain/use_case/get_category_details_case.dart';
import 'package:shop_admin/features/deliveries_feature/domain/repository/repository.dart';
import 'package:shop_admin/features/deliveries_feature/presentation/bloc/deliveries_bloc.dart';
import 'package:shop_admin/features/orders_feature/data/reposiory/repository.dart';
import 'package:shop_admin/features/orders_feature/domain/repository/repository.dart';
import 'package:shop_admin/features/orders_feature/domain/use_case/get_active_orders_case.dart';
import 'package:shop_admin/features/products_feature/data/repository/repository.dart';
import 'package:shop_admin/features/products_feature/data/sources/remote.dart';
import 'package:shop_admin/features/products_feature/domain/repository/repository.dart';
import 'package:shop_admin/features/products_feature/presentation/bloc/products_bloc.dart';
import 'package:shop_admin/features/report_feature/presentation/bloc/report_bloc.dart';
import 'compenent/data/local.dart';
import 'core/constants/constants.dart';
import 'features/categories_feature/data/sources/remote.dart';
import 'features/categories_feature/domain/use_case/add_category_case.dart';
import 'features/categories_feature/domain/use_case/delete_category_case.dart';
import 'features/categories_feature/domain/use_case/get_categories_case.dart';
import 'features/categories_feature/domain/use_case/update_category_case.dart';
import 'features/categories_feature/domain/use_case/update_category_with_image.dart';
import 'features/categories_feature/domain/use_case/choose_category_image_case.dart';
import 'features/categories_feature/presentation/bloc/categories_bloc.dart';
import 'features/deliveries_feature/data/repository/repository.dart';
import 'features/deliveries_feature/data/sources/remote.dart';
import 'features/deliveries_feature/domain/use_case/add_delivery_case.dart';
import 'features/deliveries_feature/domain/use_case/banned_delivery_case.dart';
import 'features/deliveries_feature/domain/use_case/delete_delivery_case.dart';
import 'features/deliveries_feature/domain/use_case/get_deliveries_case.dart';
import 'features/deliveries_feature/domain/use_case/get_delivery_details_case.dart';
import 'features/deliveries_feature/domain/use_case/un_banned_delivery_case.dart';
import 'features/deliveries_feature/domain/use_case/update_delivery_case.dart';
import 'features/orders_feature/data/sources/remote.dart';
import 'features/orders_feature/domain/use_case/approve_order_case.dart';
import 'features/orders_feature/domain/use_case/delete_order_case.dart';
import 'features/orders_feature/domain/use_case/get_archived_orders_case.dart';
import 'features/orders_feature/domain/use_case/get_order_details_case.dart';
import 'features/orders_feature/domain/use_case/get_pending_orders_case.dart';
import 'features/orders_feature/domain/use_case/get_waiting_orders_case.dart';
import 'features/orders_feature/presentation/bloc/orders_bloc.dart';
import 'features/products_feature/domain/use_case/add_product_case.dart';
import 'features/products_feature/domain/use_case/choose_image.dart';
import 'features/products_feature/domain/use_case/delete_product_case.dart';
import 'features/products_feature/domain/use_case/get_product_details_case.dart';
import 'features/products_feature/domain/use_case/get_products_case.dart';
import 'features/products_feature/domain/use_case/update_product_case.dart';
import 'features/products_feature/domain/use_case/update_product_with_image.dart';
import 'features/report_feature/data/repository/repository.dart';
import 'features/report_feature/data/sources/remote.dart';
import 'features/report_feature/domain/repository/repository.dart';
import 'features/report_feature/domain/use_case/get_report_case.dart';
import 'features/settings_feature/data/repository/repository.dart';
import 'features/settings_feature/data/sources/remote.dart';
import 'features/settings_feature/domain/repository/repository.dart';
import 'features/settings_feature/domain/use_case/get_settings_use_case.dart';
import 'features/settings_feature/domain/use_case/update_settings_case.dart';
import 'features/settings_feature/presentation/bloc/settings_bloc.dart';
import 'features/users_feature/data/repository/repository.dart';
import 'features/users_feature/data/sources/users_remote.dart';
import 'features/users_feature/domain/repository/repository.dart';
import 'features/users_feature/domain/use_case/get_users_case.dart';
import 'features/users_feature/presentation/bloc/users_bloc.dart';
final  sl=GetIt.instance;
late final SharedPreferences sharedPreferences;
final InternetConnectionChecker internetConnectionChecker=InternetConnectionChecker();

Future<void>init()async{


  await Firebase.initializeApp();
  await initFireBaseMessaging();
  await  Geolocator.requestPermission();
  //await FirebaseMessaging.instance.subscribeToTopic("delivery1");

   debugPrint("subscribe");
   FirebaseMessaging.instance.subscribeToTopic("admins");

   sharedPreferences=await SharedPreferences.getInstance();
   sl.registerLazySingleton(() => ComponentLocal(sharedPreferences));
   //sharedPreferences.clear();
   //sharedPreferences.setInt("deliveryId",1);


  initCategoriesFeature();

  initProductsFeature();

  initOrdersFeature();

  initDeliveriesFeature();

  initSettingsFeature();

  initUsersFeature();

  initReportFeature();
}



 initCategoriesFeature(){

  sl.registerFactory(() => CategoriesBloc(sl.call(),sl.call(),sl.call(),sl.call(),sl.call(),sl.call(),sl.call()));

  sl.registerLazySingleton(() => AddCategoryCase(sl.call()));
  sl.registerLazySingleton(() => DeleteCategoryCase(sl.call()));
  sl.registerLazySingleton(() => UpdateCategoryCase(sl.call()));
  sl.registerLazySingleton(() => UpdateCategoryWithImageCase(sl.call()));
  sl.registerLazySingleton(() => GetCategoriesCase(sl.call()));
  sl.registerLazySingleton(() => ChooseCategoryImageCase(sl.call()));
  sl.registerLazySingleton(() => GetCategoryDetailsCase(sl.call()));

  sl.registerLazySingleton<CategoriesRepository>(() => CategoriesRepositoryImp(sl.call(),internetConnectionChecker));

  sl.registerLazySingleton(() => CategoriesRemote());




 }

 initProductsFeature(){

   sl.registerFactory(() => ProductsBloc(sl.call(), sl.call(), sl.call(), sl.call(),sl.call(),sl.call(),sl.call()));

   sl.registerLazySingleton(() => AddProductCase(sl.call()));
   sl.registerLazySingleton(() => DeleteProductCase(sl.call()));
   sl.registerLazySingleton(() => GetProductCase(sl.call()));
   sl.registerLazySingleton(() => UpdateProductCase(sl.call()));
   sl.registerLazySingleton(() => UpdateProductWithImageCase(sl.call()));
   sl.registerLazySingleton(() => GetProductDetailsCase(sl.call()));
   sl.registerLazySingleton(() => ChooseProductImageCase(sl.call()));

   sl.registerLazySingleton<ProductsRepository>(() => ProductsRepositoryImp(internetConnectionChecker,sl.call()));

   sl.registerLazySingleton(()=> ProductsRemote());

 }

 initOrdersFeature(){

  sl.registerFactory(() => OrdersBloc(sl.call(), sl.call(), sl.call(), sl.call(), sl.call(),sl.call(),sl.call()));

  sl.registerLazySingleton(() => ApproveOrderCase(sl.call()));
  sl.registerLazySingleton(() => DeleteOrderCase(sl.call()));
  sl.registerLazySingleton(() => GetActiveOrdersCase(sl.call()));
  sl.registerLazySingleton(() => GetArchivedOrdersCase(sl.call()));
  sl.registerLazySingleton(() => GetPendingOrdersCase(sl.call()));
  sl.registerLazySingleton(() => GetAcceptedOrdersCase(sl.call()));
  sl.registerLazySingleton(() => GetOrderDetailsCase(sl.call()));

  sl.registerLazySingleton<OrdersRepository>(() => OrdersRepositoryImp(sl.call(),internetConnectionChecker));

  sl.registerLazySingleton(()=> OrdersRemote());


 }

 initDeliveriesFeature(){
  sl.registerFactory(() => DeliveriesBloc(sl.call(), sl.call(), sl.call(), sl.call(), sl.call(), sl.call(), sl.call()));

  sl.registerLazySingleton(() => AddDeliveryCase(sl.call()) );
  sl.registerLazySingleton(() => BannedDeliveryCase(sl.call()) );
  sl.registerLazySingleton(() => DeleteDeliveryCase(sl.call()) );
  sl.registerLazySingleton(() => GetDeliveriesCase(sl.call()) );
  sl.registerLazySingleton(() => GetDeliveryDetailsCase(sl.call()) );
  sl.registerLazySingleton(() => UnBannedDeliveryCase(sl.call()) );
  sl.registerLazySingleton(() => UpdateDeliveryCase(sl.call()) );

  sl.registerLazySingleton<DeliveriesRepository>(() => DeliveriesRepositoryImp(internetConnectionChecker,sl.call()));

  sl.registerLazySingleton(() => DeliveriesRemote());






 }

 initSettingsFeature(){

  sl.registerFactory(() => SettingsBloc(sl.call(),sl.call()));

  sl.registerLazySingleton(() => GetSettingsCase(sl.call()));
  sl.registerLazySingleton(() => UpdateSettingsCase(sl.call()));

  sl.registerLazySingleton<SettingsRepository>(() => SettingsRepositoryImp(internetConnectionChecker,sl.call()));

  sl.registerLazySingleton(() => SettingsRemote());

 }

 initUsersFeature(){

  sl.registerFactory(() => UsersBloc(sl.call()));

  sl.registerLazySingleton(() => GetUsersCase(sl.call()));

  sl.registerLazySingleton<UsersRepository>(() => UsersRepositoryImp(internetConnectionChecker,sl.call()));

  sl.registerLazySingleton(() => UsersRemote());

 }

 initReportFeature(){
  sl.registerFactory(() => ReportBloc(sl.call()));

  sl.registerLazySingleton(() =>GetReportCase(sl.call()));

  sl.registerLazySingleton<ReportRepository>(() => ReportRepositoryImp(internetConnectionChecker,sl.call()));

  sl.registerLazySingleton(() => ReportRemote());

 }














