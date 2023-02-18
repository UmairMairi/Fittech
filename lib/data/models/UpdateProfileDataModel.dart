// To parse this JSON data, do
//
//     final successResponseGeeneric = successResponseGeenericFromJson(jsonString);

import 'dart:convert';

import 'package:fit_tech/data/models/on_boarding_model/login_model.dart';

UpdateProfileModel updateProfileModelFromJson(String str) => UpdateProfileModel.fromJson(json.decode(str));

String updateProfileModelToJson(UpdateProfileModel data) => json.encode(data.toJson());

class UpdateProfileModel {
  UpdateProfileModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  final bool? success;
  final int? statusCode;
  final String? message;
  final UserProfile? data;

  UpdateProfileModel copyWith({
    bool? success,
    int? statusCode,
    String? message,
    UserProfile? data,
  }) =>
      UpdateProfileModel(
        success: success ?? this.success,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
    success: json["success"],
    statusCode: json["status_code"],
    message: json["message"],
    data: UserProfile.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "message": message,
    "data": data?.toJson(),
  };
}
