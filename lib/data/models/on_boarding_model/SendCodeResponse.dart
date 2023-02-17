
import 'dart:convert';

SendCodeResponse sendCodeModelFromJson(String str) =>
    SendCodeResponse.fromJson(json.decode(str));

String sendCodeModelToJson(SendCodeResponse data) => json.encode(data.toJson());

class SendCodeResponse {
  bool? success;
  int? statusCode;
  String? message;
  dynamic? data;

  SendCodeResponse({this.success, this.statusCode, this.message, this.data});

  SendCodeResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}
