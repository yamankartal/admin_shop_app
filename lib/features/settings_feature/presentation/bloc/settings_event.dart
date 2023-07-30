part of 'settings_bloc.dart';


abstract class SettingsEvent{}


class GetSettingsEvent extends SettingsEvent{}

class UpdateSettingsEvent extends SettingsEvent{
  final double kilometerPrice;
  final int topSellingLimit;
  final int offerLimit;
  final double deliveryKilometerEarning;
  final double deliveryReward;
  final int ordersRewardNumber;
  final double shopLat;
  final double shopLong;
  final int increasingDeliveryAcceptingPercent;
  final int orderNumberIncreasingAcceptePercent;
  UpdateSettingsEvent(this.kilometerPrice, this.topSellingLimit, this.offerLimit, this.deliveryKilometerEarning, this.deliveryReward, this.ordersRewardNumber, this.shopLat, this.shopLong, this.increasingDeliveryAcceptingPercent, this.orderNumberIncreasingAcceptePercent);
}