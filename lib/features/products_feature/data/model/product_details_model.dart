// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) => ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) => json.encode(data.toJson());

class ProductDetailsModel {
  final int? productId;
  final String? productName;
  final String? productDescription;
  final double? productPrice;
  final int? productStatus;
  final int? productCategoryId;
  final int? productQuantity;
  final String? productImage;
  final int? productDiscount;
  final int? productIsDeleted;
  final DateTime? productDateTime;
  final double? finalProductPrice;
  final int? categoryId;
  final String? categoryName;
  final String? categoryImage;
  final int? categoryIsDeleted;
  final DateTime? categoryDateTime;

 const ProductDetailsModel({
    this.productId,
    this.productName,
    this.productDescription,
    this.productPrice,
    this.productStatus,
    this.productCategoryId,
    this.productQuantity,
    this.productImage,
    this.productDiscount,
    this.productIsDeleted,
    this.productDateTime,
    this.finalProductPrice,
    this.categoryId,
    this.categoryName,
    this.categoryImage,
    this.categoryIsDeleted,
    this.categoryDateTime,
  });

  ProductDetailsModel copyWith({
    int? productId,
    String? productName,
    String? productDescription,
    double? productPrice,
    int? productStatus,
    int? productCategoryId,
    int? productQuantity,
    String? productImage,
    int? productDiscount,
    int? productIsDeleted,
    DateTime? productDateTime,
    double? finalProductPrice,
    int? categoryId,
    String? categoryName,
    String? categoryImage,
    int? categoryIsDeleted,
    DateTime? categoryDateTime,
  }) =>
      ProductDetailsModel(
        productId: productId ?? this.productId,
        productName: productName ?? this.productName,
        productDescription: productDescription ?? this.productDescription,
        productPrice: productPrice ?? this.productPrice,
        productStatus: productStatus ?? this.productStatus,
        productCategoryId: productCategoryId ?? this.productCategoryId,
        productQuantity: productQuantity ?? this.productQuantity,
        productImage: productImage ?? this.productImage,
        productDiscount: productDiscount ?? this.productDiscount,
        productIsDeleted: productIsDeleted ?? this.productIsDeleted,
        productDateTime: productDateTime ?? this.productDateTime,
        finalProductPrice: finalProductPrice ?? this.finalProductPrice,
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        categoryImage: categoryImage ?? this.categoryImage,
        categoryIsDeleted: categoryIsDeleted ?? this.categoryIsDeleted,
        categoryDateTime: categoryDateTime ?? this.categoryDateTime,
      );

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    productId: json["product_id"],
    productName: json["product_name"],
    productDescription: json["product_description"],
    productPrice: json["product_price"]?.toDouble(),
    productStatus: json["product_status"],
    productCategoryId: json["product_category_id"],
    productQuantity: json["product_quantity"],
    productImage: json["product_image"],
    productDiscount: json["product_discount"],
    productIsDeleted: json["product_is_deleted"],
    productDateTime: json["product_date_time"] == null ? null : DateTime.parse(json["product_date_time"]),
    finalProductPrice: json["final_product_price"]?.toDouble(),
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
    categoryIsDeleted: json["category_is_deleted"],
    categoryDateTime: json["category_date_time"] == null ? null : DateTime.parse(json["category_date_time"]),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "product_description": productDescription,
    "product_price": productPrice,
    "product_status": productStatus,
    "product_category_id": productCategoryId,
    "product_quantity": productQuantity,
    "product_image": productImage,
    "product_discount": productDiscount,
    "product_is_deleted": productIsDeleted,
    "product_date_time": productDateTime?.toIso8601String(),
    "final_product_price": finalProductPrice,
    "category_id": categoryId,
    "category_name": categoryName,
    "category_image": categoryImage,
    "category_is_deleted": categoryIsDeleted,
    "category_date_time": categoryDateTime?.toIso8601String(),
  };
}
