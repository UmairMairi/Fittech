// To parse this JSON data, do
//
//     final myDataScreenModel = myDataScreenModelFromJson(jsonString);

import 'dart:convert';

MyDataScreenModel myDataScreenModelFromJson(String str) => MyDataScreenModel.fromJson(json.decode(str));

String myDataScreenModelToJson(MyDataScreenModel data) => json.encode(data.toJson());

class MyDataScreenModel {
  MyDataScreenModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  final bool? success;
  final int? statusCode;
  final String? message;
  final Data? data;

  factory MyDataScreenModel.fromJson(Map<String, dynamic> json) => MyDataScreenModel(
    success: json["success"],
    statusCode: json["status_code"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.profileImage,
  });

  final String? profileImage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "profile_image": profileImage,
  };
}
