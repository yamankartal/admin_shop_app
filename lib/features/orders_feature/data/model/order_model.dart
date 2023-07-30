// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  final int? orderId;
  final DateTime? orderDateTime;

const  OrderModel({
    this.orderId,
    this.orderDateTime,
  });

  OrderModel copyWith({
    int? orderId,
    DateTime? orderDateTime,
  }) =>
      OrderModel(
        orderId: orderId ?? this.orderId,
        orderDateTime: orderDateTime ?? this.orderDateTime,
      );

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    orderId: json["order_id"],
    orderDateTime: json["order_date_time"] == null ? null : DateTime.parse(json["order_date_time"]),
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_date_time": orderDateTime?.toIso8601String(),
  };
}
