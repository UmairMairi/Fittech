// To parse this JSON data, do
//
//     final faqScreenFaqCategoriesModel = faqScreenFaqCategoriesModelFromJson(jsonString);

import 'dart:convert';

FaqScreenFaqCategoriesModel faqScreenFaqCategoriesModelFromJson(String str) => FaqScreenFaqCategoriesModel.fromJson(json.decode(str));

String faqScreenFaqCategoriesModelToJson(FaqScreenFaqCategoriesModel data) => json.encode(data.toJson());

class FaqScreenFaqCategoriesModel {
  FaqScreenFaqCategoriesModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  final bool? success;
  final int? statusCode;
  final String? message;
  final List<Datum>? data;

  factory FaqScreenFaqCategoriesModel.fromJson(Map<String, dynamic> json) => FaqScreenFaqCategoriesModel(
    success: json["success"],
    statusCode: json["status_code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
