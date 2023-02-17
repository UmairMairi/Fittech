import 'dart:convert';

LogoutResponse logoutModelFromJson(String str) =>
    LogoutResponse.fromJson(json.decode(str));

String logoutModelToJson(LogoutResponse data) => json.encode(data.toJson());

class LogoutResponse {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  LogoutResponse({this.success, this.statusCode, this.message, this.data});

  LogoutResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {


  Data();

Data.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}
}
