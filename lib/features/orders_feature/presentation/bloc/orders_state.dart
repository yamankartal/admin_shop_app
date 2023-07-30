part of 'orders_bloc.dart';

class OrdersState {
  final List<OrderModel> orders;
  final OrderDetailsModel orderDetails;
  final States approveOrderState;
  final States deleteOrderState;
  final int index;
  final String errorMsg;
  final States getOrderDetailsState;
  final States getOrdersState;


  OrdersState(
      {
        this.getOrdersState=States.init,
        this.getOrderDetailsState=States.init,
        this.index=0,
        this.deleteOrderState=States.init,
        this.approveOrderState=States.init,
        this.orders=const[], this.orderDetails=const OrderDetailsModel(), this.errorMsg=""});

  OrdersState copyWith({
    final List<OrderModel> ?orders,
    final OrderDetailsModel? orderDetails,
    final States? getOrderDetailsState,
    final String? errorMsg,
    final States ?approveOrderState,
    final States ?deleteOrderState,
    final int ?index,
    final States? getOrdersState,

  }){

    return OrdersState(
        getOrderDetailsState: getOrderDetailsState??this.getOrderDetailsState,
      orderDetails: orderDetails??this.orderDetails,
      orders: orders??this.orders,
      approveOrderState: approveOrderState??this.approveOrderState,
      deleteOrderState: deleteOrderState??this.deleteOrderState,
      errorMsg: errorMsg??this.errorMsg,
    index: index??this.index,
      getOrdersState: getOrdersState??this.getOrdersState,
    );

  }

}
