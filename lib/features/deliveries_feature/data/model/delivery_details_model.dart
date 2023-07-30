// To parse this JSON data, do
//
//     final deliveryDetailsModel = deliveryDetailsModelFromJson(jsonString);

import 'dart:convert';

DeliveryDetailsModel deliveryDetailsModelFromJson(String str) => DeliveryDetailsModel.fromJson(json.decode(str));

String deliveryDetailsModelToJson(DeliveryDetailsModel data) => json.encode(data.toJson());

class DeliveryDetailsModel {
  final int? deliveryId;
  final String? deliveryName;
  final String? deliveryEmail;
  final int? deliveryPhone;
  final int? deliveryVerifyCode;
  final int? deliveryApprove;
  final int? deliveryStatus;
  final int? deliveryAcceptingPercent;
  final int? deliveryCancelingPercent;
  final int? deliveryOrdersCount;
  final int? deliveryBanned;
  final double? deliveryBalance;
  final int? deliveryOrderStage;
  final double? deliveryLat;
  final double? deliveryLong;
  final DateTime? deliveryCreateTime;
  final int? deliveryIsDeleted;

 const DeliveryDetailsModel({
    this.deliveryId,
    this.deliveryName,
    this.deliveryEmail,
    this.deliveryPhone,
    this.deliveryVerifyCode,
    this.deliveryApprove,
    this.deliveryStatus,
    this.deliveryAcceptingPercent,
    this.deliveryCancelingPercent,
    this.deliveryOrdersCount,
    this.deliveryBanned,
    this.deliveryBalance,
    this.deliveryOrderStage,
    this.deliveryLat,
    this.deliveryLong,
    this.deliveryCreateTime,
    this.deliveryIsDeleted,
  });

  DeliveryDetailsModel copyWith({
    int? deliveryId,
    String? deliveryName,
    String? deliveryEmail,
    int? deliveryPhone,
    int? deliveryVerifyCode,
    int? deliveryApprove,
    int? deliveryStatus,
    int? deliveryAcceptingPercent,
    int? deliveryCancelingPercent,
    int? deliveryOrdersCount,
    int? deliveryBanned,
    double? deliveryBalance,
    int? deliveryOrderStage,
    double? deliveryLat,
    double? deliveryLong,
    DateTime? deliveryCreateTime,
    int? deliveryIsDeleted,
  }) =>
      DeliveryDetailsModel(
        deliveryId: deliveryId ?? this.deliveryId,
        deliveryName: deliveryName ?? this.deliveryName,
        deliveryEmail: deliveryEmail ?? this.deliveryEmail,
        deliveryPhone: deliveryPhone ?? this.deliveryPhone,
        deliveryVerifyCode: deliveryVerifyCode ?? this.deliveryVerifyCode,
        deliveryApprove: deliveryApprove ?? this.deliveryApprove,
        deliveryStatus: deliveryStatus ?? this.deliveryStatus,
        deliveryAcceptingPercent: deliveryAcceptingPercent ?? this.deliveryAcceptingPercent,
        deliveryCancelingPercent: deliveryCancelingPercent ?? this.deliveryCancelingPercent,
        deliveryOrdersCount: deliveryOrdersCount ?? this.deliveryOrdersCount,
        deliveryBanned: deliveryBanned ?? this.deliveryBanned,
        deliveryBalance: deliveryBalance ?? this.deliveryBalance,
        deliveryOrderStage: deliveryOrderStage ?? this.deliveryOrderStage,
        deliveryLat: deliveryLat ?? this.deliveryLat,
        deliveryLong: deliveryLong ?? this.deliveryLong,
        deliveryCreateTime: deliveryCreateTime ?? this.deliveryCreateTime,
        deliveryIsDeleted: deliveryIsDeleted ?? this.deliveryIsDeleted,
      );

  factory DeliveryDetailsModel.fromJson(Map<String, dynamic> json) => DeliveryDetailsModel(
    deliveryId: json["delivery_id"],
    deliveryName: json["delivery_name"],
    deliveryEmail: json["delivery_email"],
    deliveryPhone: json["delivery_phone"],
    deliveryVerifyCode: json["delivery_verify_code"],
    deliveryApprove: json["delivery_approve"],
    deliveryStatus: json["delivery_status"],
    deliveryAcceptingPercent: json["delivery_accepting_percent"],
    deliveryCancelingPercent: json["delivery_canceling_percent"],
    deliveryOrdersCount: json["delivery_orders_count"],
    deliveryBanned: json["delivery_banned"],
    deliveryBalance: json["delivery_balance"]?.toDouble(),
    deliveryOrderStage: json["delivery_order_stage"],
    deliveryLat: json["delivery_lat"]?.toDouble(),
    deliveryLong: json["delivery_long"]?.toDouble(),
    deliveryCreateTime: json["delivery_create_time"] == null ? null : DateTime.parse(json["delivery_create_time"]),
    deliveryIsDeleted: json["delivery_is_deleted"],
  );

  Map<String, dynamic> toJson() => {
    "delivery_id": deliveryId,
    "delivery_name": deliveryName,
    "delivery_email": deliveryEmail,
    "delivery_phone": deliveryPhone,
    "delivery_verify_code": deliveryVerifyCode,
    "delivery_approve": deliveryApprove,
    "delivery_status": deliveryStatus,
    "delivery_accepting_percent": deliveryAcceptingPercent,
    "delivery_canceling_percent": deliveryCancelingPercent,
    "delivery_orders_count": deliveryOrdersCount,
    "delivery_banned": deliveryBanned,
    "delivery_balance": deliveryBalance,
    "delivery_order_stage": deliveryOrderStage,
    "delivery_lat": deliveryLat,
    "delivery_long": deliveryLong,
    "delivery_create_time": deliveryCreateTime?.toIso8601String(),
    "delivery_is_deleted": deliveryIsDeleted,
  };
}
