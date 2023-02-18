// To parse this JSON data, do
//
//     final successResponseGeeneric = successResponseGeenericFromJson(jsonString);

import 'dart:convert';

SuccessResponseGeneric successResponseGenericFromJson(String str) => SuccessResponseGeneric.fromJson(json.decode(str));

String successResponseGenericToJson(SuccessResponseGeneric data) => json.encode(data.toJson());

class SuccessResponseGeneric {
  SuccessResponseGeneric({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  final bool? success;
  final int? statusCode;
  final String? message;
  final dynamic data;

  SuccessResponseGeneric copyWith({
    bool? success,
    int? statusCode,
    String? message,
    dynamic data,
  }) =>
      SuccessResponseGeneric(
        success: success ?? this.success,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory SuccessResponseGeneric.fromJson(Map<String, dynamic> json) => SuccessResponseGeneric(
    success: json["success"],
    statusCode: json["status_code"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "message": message,
    "data": data,
  };
}
