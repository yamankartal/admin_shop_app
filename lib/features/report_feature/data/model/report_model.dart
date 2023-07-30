// To parse this JSON data, do
//
//     final reportModel = reportModelFromJson(jsonString);

import 'dart:convert';

ReportModel reportModelFromJson(String str) => ReportModel.fromJson(json.decode(str));

String reportModelToJson(ReportModel data) => json.encode(data.toJson());

class ReportModel {
  final double? profits;
  final int? totalOrders;
  final double? sale;
  final double? totalProfits;
  final double? ordersRating;

  const ReportModel({
    this.profits,
    this.totalOrders,
    this.sale,
    this.totalProfits,
    this.ordersRating,
  });

  ReportModel copyWith({
    double? profits,
    int? totalOrders,
    double? sale,
    double? totalProfits,
    double? ordersRating,
  }) =>
      ReportModel(
        profits: profits ?? this.profits,
        totalOrders: totalOrders ?? this.totalOrders,
        sale: sale ?? this.sale,
        totalProfits: totalProfits ?? this.totalProfits,
        ordersRating: ordersRating ?? this.ordersRating,
      );

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
    profits: json["profits"]?.toDouble(),
    totalOrders: json["total_orders"],
    sale: json["sale"]?.toDouble(),
    totalProfits: json["total_profits"]?.toDouble(),
    ordersRating: json["ordersRating"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "profits": profits,
    "total_orders": totalOrders,
    "sale": sale,
    "total_profits": totalProfits,
    "ordersRating": ordersRating,
  };
}
