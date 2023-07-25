part of 'orders_bloc.dart';

abstract class OrdersEvent {}

class GetActiveOrdersEvent extends OrdersEvent{}
class GetArchivedOrdersEvent  extends OrdersEvent{}
class GetPendingOrdersEvent extends OrdersEvent{}
class GetAcceptedOrdersEvent extends OrdersEvent{}
class ApproveOrderEvent extends OrdersEvent {
  final int index;
  ApproveOrderEvent(this.index);
}
class DeleteOrderEvent extends OrdersEvent{
  final int index;

  DeleteOrderEvent(this.index);
}
class ChangePageViewIndexEvent extends OrdersEvent{
  final int index;

  ChangePageViewIndexEvent(this.index);
}


class RefreshOrdersEvent extends OrdersEvent {
  final int orderId;

  RefreshOrdersEvent(this.orderId);

}


class GetOrderDetailsEvent extends OrdersEvent{
  final int orderId;
  GetOrderDetailsEvent(this.orderId);
}