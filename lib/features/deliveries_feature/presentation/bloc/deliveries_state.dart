part of 'deliveries_bloc.dart';

class DeliveriesState {
  final List<DeliveryModel> deliveries;
  final DeliveryDetailsModel deliveryDetails;
  final States getDeliveriesState;
  final States getDeliveryDetailsState;
  final States updateDeliveryDetailsState;
  final States deleteDeliveryState;
  final States bannedDeliveryState;
  final States unBannedDeliveryState;
  final States addDeliveryState;
  final String errorMsg;



  DeliveriesState({
      this.deliveries=const[],
      this.deliveryDetails=const DeliveryDetailsModel(),
      this.getDeliveriesState=States.init,
      this.getDeliveryDetailsState=States.init,
      this.updateDeliveryDetailsState=States.init,
      this.deleteDeliveryState=States.init,
      this.bannedDeliveryState=States.init,
      this.unBannedDeliveryState=States.init,
      this.addDeliveryState=States.init,
      this.errorMsg='',
  });


  DeliveriesState copyWith({

    final List<DeliveryModel>? deliveries,
    final DeliveryDetailsModel?  deliveryDetails,
    final States?  getDeliveriesState,
    final States ? getDeliveryDetailsState,
    final States?  updateDeliveryDetailsState,
    final States?  deleteDeliveryState,
    final States?  bannedDeliveryState,
    final States?  unBannedDeliveryState,
    final States ?addDeliveryState,
    final String ? errorMsg,


}){
    return DeliveriesState(
        deliveries:deliveries??this.deliveries,
        deliveryDetails:deliveryDetails??this.deliveryDetails,
        getDeliveriesState:getDeliveriesState??this.getDeliveriesState,
        getDeliveryDetailsState:getDeliveryDetailsState??this.getDeliveryDetailsState,
        updateDeliveryDetailsState:updateDeliveryDetailsState??this.updateDeliveryDetailsState,
        deleteDeliveryState:deleteDeliveryState??this.deleteDeliveryState,
        bannedDeliveryState:bannedDeliveryState??this.bannedDeliveryState,
        unBannedDeliveryState:unBannedDeliveryState??this.unBannedDeliveryState,
        addDeliveryState: addDeliveryState??this.addDeliveryState,
        errorMsg:errorMsg??this.errorMsg,
    );
  }

}
