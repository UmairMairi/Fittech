import 'dart:convert';

FaqCategories faqCategoriesModelFromJson(String str) =>
    FaqCategories.fromJson(json.decode(str));

String faqCategoriesModelToJson(FaqCategories data) => json.encode(data.toJson());

class FaqCategories {
  bool? success;
  int? statusCode;
  String? message;
  List<CategoryData>? data;

  FaqCategories({this.success, this.statusCode, this.message, this.data});

  FaqCategories.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add(new CategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  CategoryData({this.id, this.name, this.createdAt, this.updatedAt});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
