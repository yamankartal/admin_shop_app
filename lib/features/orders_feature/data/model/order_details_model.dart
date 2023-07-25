// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) => json.encode(data.toJson());

class OrderDetailsModel {
  final int? orderId;
  final int? orderUserId;
  final int? orderAddressId;
  final int? orderPrice;
  final int? orderDeliveryPrice;
  final int? orderTotalPrice;
  final int? orderPaymentMethode;
  final int? orderType;
  final int? orderStatus;
  final String? orderComment;
  final int? orderRating;
  final DateTime? orderDateTime;
  final dynamic orderCouponId;
  final int? orderDistance;
  final int? orderDeliveryId;
  final int? deliveryKilometerEarning;
  final String? orderAccepteTime;
  final int? addressId;
  final String? addressCity;
  final String? addressStreet;
  final double? addressLat;
  final double? addressLong;
  final String? addressDetails;
  final String? addressFloor;
  final int? addressStatus;
  final int? addressUserId;
  final int? addressPhone;
  final double? addressDistance;
  final int? userId;
  final String? userName;
  final String? userEmail;
  final String? userPassword;
  final int? userPhone;
  final int? userApprove;
  final DateTime? userCreateTime;
  final String? userImage;
  final int? userVerifyCode;
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
  final dynamic coupon;


  couponDiscount(){
    return orderPrice!*coupon!.couponDiscount!;
  }


const  OrderDetailsModel({
    this.orderId,
    this.orderUserId,
    this.orderAddressId,
    this.orderPrice,
    this.orderDeliveryPrice,
    this.orderTotalPrice,
    this.orderPaymentMethode,
    this.orderType,
    this.orderStatus,
    this.orderComment,
    this.orderRating,
    this.orderDateTime,
    this.orderCouponId,
    this.orderDistance,
    this.orderDeliveryId,
    this.deliveryKilometerEarning,
    this.orderAccepteTime,
    this.addressId,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
    this.addressDetails,
    this.addressFloor,
    this.addressStatus,
    this.addressUserId,
    this.addressPhone,
    this.addressDistance,
    this.userId,
    this.userName,
    this.userEmail,
    this.userPassword,
    this.userPhone,
    this.userApprove,
    this.userCreateTime,
    this.userImage,
    this.userVerifyCode,
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
    this.coupon,
  });

  OrderDetailsModel copyWith({
    int? orderId,
    int? orderUserId,
    int? orderAddressId,
    int? orderPrice,
    int? orderDeliveryPrice,
    int? orderTotalPrice,
    int? orderPaymentMethode,
    int? orderType,
    int? orderStatus,
    String? orderComment,
    int? orderRating,
    DateTime? orderDateTime,
    dynamic orderCouponId,
    int? orderDistance,
    int? orderDeliveryId,
    int? deliveryKilometerEarning,
    String? orderAccepteTime,
    int? addressId,
    String? addressCity,
    String? addressStreet,
    double? addressLat,
    double? addressLong,
    String? addressDetails,
    String? addressFloor,
    int? addressStatus,
    int? addressUserId,
    int? addressPhone,
    double? addressDistance,
    int? userId,
    String? userName,
    String? userEmail,
    String? userPassword,
    int? userPhone,
    int? userApprove,
    DateTime? userCreateTime,
    String? userImage,
    int? userVerifyCode,
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
    dynamic coupon,
  }) =>
      OrderDetailsModel(
        orderId: orderId ?? this.orderId,
        orderUserId: orderUserId ?? this.orderUserId,
        orderAddressId: orderAddressId ?? this.orderAddressId,
        orderPrice: orderPrice ?? this.orderPrice,
        orderDeliveryPrice: orderDeliveryPrice ?? this.orderDeliveryPrice,
        orderTotalPrice: orderTotalPrice ?? this.orderTotalPrice,
        orderPaymentMethode: orderPaymentMethode ?? this.orderPaymentMethode,
        orderType: orderType ?? this.orderType,
        orderStatus: orderStatus ?? this.orderStatus,
        orderComment: orderComment ?? this.orderComment,
        orderRating: orderRating ?? this.orderRating,
        orderDateTime: orderDateTime ?? this.orderDateTime,
        orderCouponId: orderCouponId ?? this.orderCouponId,
        orderDistance: orderDistance ?? this.orderDistance,
        orderDeliveryId: orderDeliveryId ?? this.orderDeliveryId,
        deliveryKilometerEarning: deliveryKilometerEarning ?? this.deliveryKilometerEarning,
        orderAccepteTime: orderAccepteTime ?? this.orderAccepteTime,
        addressId: addressId ?? this.addressId,
        addressCity: addressCity ?? this.addressCity,
        addressStreet: addressStreet ?? this.addressStreet,
        addressLat: addressLat ?? this.addressLat,
        addressLong: addressLong ?? this.addressLong,
        addressDetails: addressDetails ?? this.addressDetails,
        addressFloor: addressFloor ?? this.addressFloor,
        addressStatus: addressStatus ?? this.addressStatus,
        addressUserId: addressUserId ?? this.addressUserId,
        addressPhone: addressPhone ?? this.addressPhone,
        addressDistance: addressDistance ?? this.addressDistance,
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        userEmail: userEmail ?? this.userEmail,
        userPassword: userPassword ?? this.userPassword,
        userPhone: userPhone ?? this.userPhone,
        userApprove: userApprove ?? this.userApprove,
        userCreateTime: userCreateTime ?? this.userCreateTime,
        userImage: userImage ?? this.userImage,
        userVerifyCode: userVerifyCode ?? this.userVerifyCode,
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
        coupon: coupon ?? this.coupon,
      );

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
    orderId: json["order_id"],
    orderUserId: json["order_user_id"],
    orderAddressId: json["order_address_id"],
    orderPrice: json["order_price"],
    orderDeliveryPrice: json["order_delivery_price"],
    orderTotalPrice: json["order_total_price"],
    orderPaymentMethode: json["order_payment_methode"],
    orderType: json["order_type"],
    orderStatus: json["order_status"],
    orderComment: json["order_comment"],
    orderRating: json["order_rating"],
    orderDateTime: json["order_date_time"] == null ? null : DateTime.parse(json["order_date_time"]),
    orderCouponId: json["order_coupon_id"],
    orderDistance: json["order_distance"],
    orderDeliveryId: json["order_delivery_id"],
    deliveryKilometerEarning: json["delivery_kilometer_earning"],
    orderAccepteTime: json["order_accepte_time"],
    addressId: json["address_id"],
    addressCity: json["address_city"],
    addressStreet: json["address_street"],
    addressLat: json["address_lat"]?.toDouble(),
    addressLong: json["address_long"]?.toDouble(),
    addressDetails: json["address_details"],
    addressFloor: json["address_floor"],
    addressStatus: json["address_status"],
    addressUserId: json["address_user_id"],
    addressPhone: json["address_phone"],
    addressDistance: json["address_distance"]?.toDouble(),
    userId: json["user_id"],
    userName: json["user_name"],
    userEmail: json["user_email"],
    userPassword: json["user_password"],
    userPhone: json["user_phone"],
    userApprove: json["user_approve"],
    userCreateTime: json["user_create_time"] == null ? null : DateTime.parse(json["user_create_time"]),
    userImage: json["user_image"],
    userVerifyCode: json["user_verify_code"],
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
    coupon: json["coupon"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_user_id": orderUserId,
    "order_address_id": orderAddressId,
    "order_price": orderPrice,
    "order_delivery_price": orderDeliveryPrice,
    "order_total_price": orderTotalPrice,
    "order_payment_methode": orderPaymentMethode,
    "order_type": orderType,
    "order_status": orderStatus,
    "order_comment": orderComment,
    "order_rating": orderRating,
    "order_date_time": orderDateTime?.toIso8601String(),
    "order_coupon_id": orderCouponId,
    "order_distance": orderDistance,
    "order_delivery_id": orderDeliveryId,
    "delivery_kilometer_earning": deliveryKilometerEarning,
    "order_accepte_time": orderAccepteTime,
    "address_id": addressId,
    "address_city": addressCity,
    "address_street": addressStreet,
    "address_lat": addressLat,
    "address_long": addressLong,
    "address_details": addressDetails,
    "address_floor": addressFloor,
    "address_status": addressStatus,
    "address_user_id": addressUserId,
    "address_phone": addressPhone,
    "address_distance": addressDistance,
    "user_id": userId,
    "user_name": userName,
    "user_email": userEmail,
    "user_password": userPassword,
    "user_phone": userPhone,
    "user_approve": userApprove,
    "user_create_time": userCreateTime?.toIso8601String(),
    "user_image": userImage,
    "user_verify_code": userVerifyCode,
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
    "coupon": coupon,
  };
}

