import 'package:bloc/bloc.dart';
import 'package:shop_admin/core/constants/convert.dart';

import '../../../../core/constants/enums.dart';
import '../../data/model/order_details_model.dart';
import '../../data/model/order_model.dart';
import '../../domain/use_case/approve_order_case.dart';
import '../../domain/use_case/delete_order_case.dart';
import '../../domain/use_case/get_active_orders_case.dart';
import '../../domain/use_case/get_archived_orders_case.dart';
import '../../domain/use_case/get_order_details_case.dart';
import '../../domain/use_case/get_pending_orders_case.dart';
import '../../domain/use_case/get_waiting_orders_case.dart';

part 'orders_event.dart';

part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final ApproveOrderCase approveOrderCase;
  final DeleteOrderCase deleteOrderCase;
  final GetActiveOrdersCase getActiveOrdersCase;
  final GetArchivedOrdersCase getArchivedOrdersCase;
  final GetPendingOrdersCase getPendingOrdersCase;
  final GetAcceptedOrdersCase getAcceptedOrdersCase;
  final GetOrderDetailsCase getOrderDetailsCase;

  OrdersBloc(

      this.approveOrderCase,
      this.deleteOrderCase,
      this.getActiveOrdersCase,
      this.getArchivedOrdersCase,
      this.getPendingOrdersCase,
      this.getAcceptedOrdersCase, this.getOrderDetailsCase)
      : super(OrdersState()) {
    on<GetArchivedOrdersEvent>(  (event, emit) async {
        emit(state.copyWith(getOrdersState: States.loading));
        final res = await getArchivedOrdersCase(ParamGetArchivedOrders());
        res.fold(
          (l) => emit(
            state.copyWith(
              getOrdersState: States.error,
              errorMsg: errorMsg(l),
            ),
          ),
          (r) => emit(
            state.copyWith(
              getOrdersState: States.loaded,
              orders: List.of(r),
            ),
          ),
        );
      },);


    on<GetActiveOrdersEvent>((event, emit) async {
      emit(state.copyWith(getOrdersState: States.loading));
      final res = await getActiveOrdersCase(ParamGetActiveOrders());
      res.fold(
            (l) => emit(
          state.copyWith(
            getOrdersState: States.error,
            errorMsg: errorMsg(l),
          ),
        ),
            (r) => emit(
          state.copyWith(
            getOrdersState: States.loaded,
            orders: List.of(r),
          ),
        ),
      );


    });


    on<GetPendingOrdersEvent>((event, emit) async {
      emit(state.copyWith(getOrdersState: States.loading));
      final res = await getPendingOrdersCase(ParamGetPendingOrders());
      res.fold(
            (l) => emit(
          state.copyWith(
            getOrdersState: States.error,
            errorMsg: errorMsg(l),
          ),
        ),
            (r) => emit(
          state.copyWith(
            getOrdersState: States.loaded,
            orders: List.of(r),
          ),
        ),
      );

    });


    on<GetAcceptedOrdersEvent>((event, emit) async {
      emit(state.copyWith(getOrdersState: States.loading));
      final res = await getAcceptedOrdersCase(ParamGetAcceptedOrders());
      res.fold(
            (l) => emit(
          state.copyWith(
            getOrdersState: States.error,
            errorMsg: errorMsg(l),
          ),
        ),
            (r) => emit(
          state.copyWith(
            getOrdersState: States.loaded,
            orders: List.of(r),
          ),
        ),
      );
    });


    on<ApproveOrderEvent>((event, emit) async {
      emit(state.copyWith(approveOrderState: States.loading));
      final OrderModel orderModel=state.orders[event.index];
      final res = await approveOrderCase(ParamApproveOrders(orderModel.orderId!,orderModel.orderDateTime!));
      res.fold(
            (l) => emit(
          state.copyWith(
            approveOrderState: States.error,
            errorMsg: errorMsg(l),
          ),
        ),
            (r) => emit(
          state.copyWith(
            approveOrderState: States.loaded,
            orders: List.of(state.orders)..removeAt(event.index)
          ),
        ),
      );
    });


    on<DeleteOrderEvent>((event, emit) async {
      emit(state.copyWith(deleteOrderState: States.loading));
      final OrderModel orderModel=state.orders[event.index];
      final res = await deleteOrderCase(ParamDeleteOrders(orderModel.orderId!));
      res.fold(
            (l) => emit(
          state.copyWith(
            deleteOrderState: States.error,
            errorMsg: errorMsg(l),
          ),
        ),
            (r) => emit(
          state.copyWith(
            deleteOrderState: States.loaded,
            orders: List.of(state.orders)..removeAt(event.index)
          ),
        ),
      );
    });

    on<ChangePageViewIndexEvent>((event, emit) {
      emit(state.copyWith(index: event.index));
    });

    on<RefreshOrdersEvent>((event, emit) {
      if(state.orders.isNotEmpty){
        emit(state.copyWith(orders: List.of(state.orders)..removeWhere((element) => element.orderId==event.orderId)));
      }
    });


    on<GetOrderDetailsEvent>((event, emit)async{
      emit(state.copyWith(getOrderDetailsState: States.loading));
      final res =await getOrderDetailsCase(ParamGetOrderDetails(event.orderId));
      res.fold((l) => emit(state.copyWith(getOrderDetailsState: States.error)), (r) => emit(state.copyWith(getOrderDetailsState: States.loaded,orderDetails: r)));
    });


  }
}
