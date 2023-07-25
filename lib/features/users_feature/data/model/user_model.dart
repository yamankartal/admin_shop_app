// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String? userName;
  final String? userEmail;
  final int? userPhone;
  final DateTime? userCreateTime;
  final String? userImage;
  final int? userVerifyCode;

  const UserModel({
    this.userName,
    this.userEmail,
    this.userPhone,
    this.userCreateTime,
    this.userImage,
    this.userVerifyCode,
  });

  UserModel copyWith({
    String? userName,
    String? userEmail,
    int? userPhone,
    DateTime? userCreateTime,
    String? userImage,
    int? userVerifyCode,
  }) =>
      UserModel(
        userName: userName ?? this.userName,
        userEmail: userEmail ?? this.userEmail,
        userPhone: userPhone ?? this.userPhone,
        userCreateTime: userCreateTime ?? this.userCreateTime,
        userImage: userImage ?? this.userImage,
        userVerifyCode: userVerifyCode ?? this.userVerifyCode,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userName: json["user_name"],
    userEmail: json["user_email"],
    userPhone: json["user_phone"],
    userCreateTime: json["user_create_time"] == null ? null : DateTime.parse(json["user_create_time"]),
    userImage: json["user_image"],
    userVerifyCode: json["user_verify_code"],
  );

  Map<String, dynamic> toJson() => {
    "user_name": userName,
    "user_email": userEmail,
    "user_phone": userPhone,
    "user_create_time": userCreateTime?.toIso8601String(),
    "user_image": userImage,
    "user_verify_code": userVerifyCode,
  };
}
