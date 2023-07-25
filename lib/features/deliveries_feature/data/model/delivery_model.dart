// To parse this JSON data, do
//
//     final deliveryModel = deliveryModelFromJson(jsonString);

import 'dart:convert';

DeliveryModel deliveryModelFromJson(String str) => DeliveryModel.fromJson(json.decode(str));

String deliveryModelToJson(DeliveryModel data) => json.encode(data.toJson());

class DeliveryModel {
  final int? deliveryId;
  final String? deliveryName;
  final int? deliveryPhone;
  final int? deliveryStatus;
  final int? deliveryBanned;

 const DeliveryModel({
    this.deliveryId,
    this.deliveryName,
    this.deliveryPhone,
    this.deliveryStatus,
    this.deliveryBanned,
  });

  DeliveryModel copyWith({
    int? deliveryId,
    String? deliveryName,
    int? deliveryPhone,
    int? deliveryStatus,
    int? deliveryBanned,
  }) =>
      DeliveryModel(
        deliveryId: deliveryId ?? this.deliveryId,
        deliveryName: deliveryName ?? this.deliveryName,
        deliveryPhone: deliveryPhone ?? this.deliveryPhone,
        deliveryStatus: deliveryStatus ?? this.deliveryStatus,
        deliveryBanned: deliveryBanned ?? this.deliveryBanned,
      );

  factory DeliveryModel.fromJson(Map<String, dynamic> json) => DeliveryModel(
    deliveryId: json["delivery_id"],
    deliveryName: json["delivery_name"],
    deliveryPhone: json["delivery_phone"],
    deliveryStatus: json["delivery_status"],
    deliveryBanned: json["delivery_banned"],
  );

  Map<String, dynamic> toJson() => {
    "delivery_id": deliveryId,
    "delivery_name": deliveryName,
    "delivery_phone": deliveryPhone,
    "delivery_status": deliveryStatus,
    "delivery_banned": deliveryBanned,
  };
}
