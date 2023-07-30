part of 'deliveries_bloc.dart';


abstract class DeliveriesEvent{}


class AddDeliveryEvent extends DeliveriesEvent{
  final String name;
  final String email;
  final int phone;
  AddDeliveryEvent(this.name, this.email, this.phone);
}
class BannedDeliveryEvent extends DeliveriesEvent{
  final int index;
  BannedDeliveryEvent(this.index);
}
class DeleteDeliveryEvent extends DeliveriesEvent{
  final int index;

  DeleteDeliveryEvent(this.index);
}
class GetDeliveriesEvent extends DeliveriesEvent{}
class GetDeliveryDetailsEvent extends DeliveriesEvent{
  final int index;

  GetDeliveryDetailsEvent(this.index);
}
class UnBannedDeliveryEvent extends DeliveriesEvent{
  final int index;
  UnBannedDeliveryEvent(this.index);
}
class UpdateDeliveryEvent extends DeliveriesEvent{
  final int index;
  final String name;
  final String email;
  final int phone;
  UpdateDeliveryEvent(this.name, this.email, this.phone, this.index);
}
