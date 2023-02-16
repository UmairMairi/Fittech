import 'dart:convert';

DataPolicy dataPolicyModelFromJson(String str) =>
    DataPolicy.fromJson(json.decode(str));

String dataPolicyModelToJson(DataPolicy data) => json.encode(data.toJson());

class DataPolicy {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  DataPolicy({this.success, this.statusCode, this.message, this.data});

  DataPolicy.fromJson(Map<String, dynamic> json) {
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
  String? description;

  Data({this.description});

  Data.fromJson(Map<String, dynamic> json) {
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    return data;
  }
}
