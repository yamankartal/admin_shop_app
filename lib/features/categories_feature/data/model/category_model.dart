// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  final int? categoryId;
  final String? categoryName;
  final String? categoryImage;
  final int? categoryIsDeleted;
  final DateTime? categoryDateTime;

 const CategoryModel({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
    this.categoryIsDeleted,
    this.categoryDateTime,
  });

  CategoryModel copyWith({
    int? categoryId,
    String? categoryName,
    String? categoryImage,
    int? categoryIsDeleted,
    DateTime? categoryDateTime,
  }) =>
      CategoryModel(
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        categoryImage: categoryImage ?? this.categoryImage,
        categoryIsDeleted: categoryIsDeleted ?? this.categoryIsDeleted,
        categoryDateTime: categoryDateTime ?? this.categoryDateTime,
      );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
    categoryIsDeleted: json["category_is_deleted"],
    categoryDateTime: json["category_date_time"] == null ? null : DateTime.parse(json["category_date_time"]),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "category_image": categoryImage,
    "category_is_deleted": categoryIsDeleted,
    "category_date_time": categoryDateTime?.toIso8601String(),
  };
}
