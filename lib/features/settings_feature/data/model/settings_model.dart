// To parse this JSON data, do
//
//     final settingsModel = settingsModelFromJson(jsonString);

import 'dart:convert';

SettingsModel settingsModelFromJson(String str) => SettingsModel.fromJson(json.decode(str));

String settingsModelToJson(SettingsModel data) => json.encode(data.toJson());

class SettingsModel {
  final int? kilometerPrice;
  final int? topSellingLimit;
  final int? offerLimit;
  final int? deliveryKilometerEarning;
  final int? deliveryReward;
  final int? settingId;
  final int? ordersRewardNumber;
  final double? shopLat;
  final double? shopLong;
  final int? increasingDeliveryAcceptingPercent;
  final int? orderNumberIncreasingAcceptePercent;

 const SettingsModel({
    this.kilometerPrice,
    this.topSellingLimit,
    this.offerLimit,
    this.deliveryKilometerEarning,
    this.deliveryReward,
    this.settingId,
    this.ordersRewardNumber,
    this.shopLat,
    this.shopLong,
    this.increasingDeliveryAcceptingPercent,
    this.orderNumberIncreasingAcceptePercent,
  });

  SettingsModel copyWith({
    int? kilometerPrice,
    int? topSellingLimit,
    int? offerLimit,
    int? deliveryKilometerEarning,
    int? deliveryReward,
    int? settingId,
    int? ordersRewardNumber,
    double? shopLat,
    double? shopLong,
    int? increasingDeliveryAcceptingPercent,
    int? orderNumberIncreasingAcceptePercent,
  }) =>
      SettingsModel(
        kilometerPrice: kilometerPrice ?? this.kilometerPrice,
        topSellingLimit: topSellingLimit ?? this.topSellingLimit,
        offerLimit: offerLimit ?? this.offerLimit,
        deliveryKilometerEarning: deliveryKilometerEarning ?? this.deliveryKilometerEarning,
        deliveryReward: deliveryReward ?? this.deliveryReward,
        settingId: settingId ?? this.settingId,
        ordersRewardNumber: ordersRewardNumber ?? this.ordersRewardNumber,
        shopLat: shopLat ?? this.shopLat,
        shopLong: shopLong ?? this.shopLong,
        increasingDeliveryAcceptingPercent: increasingDeliveryAcceptingPercent ?? this.increasingDeliveryAcceptingPercent,
        orderNumberIncreasingAcceptePercent: orderNumberIncreasingAcceptePercent ?? this.orderNumberIncreasingAcceptePercent,
      );

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
    kilometerPrice: json["kilometer_price"],
    topSellingLimit: json["top_selling_limit"],
    offerLimit: json["offer_limit"],
    deliveryKilometerEarning: json["delivery_kilometer_earning"],
    deliveryReward: json["delivery_reward"],
    settingId: json["setting_id"],
    ordersRewardNumber: json["orders_reward_number"],
    shopLat: json["shop_lat"]?.toDouble(),
    shopLong: json["shop_long"]?.toDouble(),
    increasingDeliveryAcceptingPercent: json["inccreasing_delivery_accepting_percent"],
    orderNumberIncreasingAcceptePercent: json["order_number_increasing_accepte_percent"],
  );

  Map<String, dynamic> toJson() => {
    "kilometer_price": kilometerPrice,
    "top_selling_limit": topSellingLimit,
    "offer_limit": offerLimit,
    "delivery_kilometer_earning": deliveryKilometerEarning,
    "delivery_reward": deliveryReward,
    "setting_id": settingId,
    "orders_reward_number": ordersRewardNumber,
    "shop_lat": shopLat,
    "shop_long": shopLong,
    "inccreasing_delivery_accepting_percent": increasingDeliveryAcceptingPercent,
    "order_number_increasing_accepte_percent": orderNumberIncreasingAcceptePercent,
  };
}
