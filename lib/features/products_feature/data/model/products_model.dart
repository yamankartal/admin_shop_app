// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final int? productId;
  final String? productName;
  final String? productImage;
  final DateTime? productDateTime;
  final int? productCategoryId;

const ProductModel({
    this.productId,
    this.productName,
    this.productImage,
    this.productDateTime,
    this.productCategoryId,
  });

  ProductModel copyWith({
    int? productId,
    String? productName,
    String? productImage,
    DateTime? productDateTime,
    int? productCategoryId,
  }) =>
      ProductModel(
        productId: productId ?? this.productId,
        productName: productName ?? this.productName,
        productImage: productImage ?? this.productImage,
        productDateTime: productDateTime ?? this.productDateTime,
        productCategoryId: productCategoryId ?? this.productCategoryId,
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    productId: json["product_id"],
    productName: json["product_name"],
    productImage: json["product_image"],
    productDateTime: json["product_date_time"] == null ? null : DateTime.parse(json["product_date_time"]),
    productCategoryId: json["product_category_id"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "product_image": productImage,
    "product_date_time": productDateTime?.toIso8601String(),
    "product_category_id": productCategoryId,
  };
}
