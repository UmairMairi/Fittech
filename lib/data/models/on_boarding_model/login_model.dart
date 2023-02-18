// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  final bool? success;
  final int? statusCode;
  final String? message;
  Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
    this.token,
    this.userProfile,
  });

  final String? token;
  UserProfile? userProfile;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        userProfile: json["user_profile"] == null
            ? null
            : UserProfile.fromJson(json["user_profile"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user_profile": userProfile?.toJson(),
      };
}

class UserProfile {
  UserProfile({
    this.user,
    this.phone,
    this.emailVerified,
    this.gender,
    this.verificationCode,
    this.packagePlan,
    this.deleteRequested,
    this.createdAt,
    this.updatedAt,
    this.profileImageUrl,
  });

  final User? user;
  final dynamic phone;
  final bool? emailVerified;
  final String? gender;
  final int? verificationCode;
  final dynamic packagePlan;
  final bool? deleteRequested;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? profileImageUrl;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        phone: json["phone"],
        emailVerified: json["email_verified"],
        gender: json["gender"],
        verificationCode: json["verification_code"],
        packagePlan: json["package_plan"],
        deleteRequested: json["delete_requested"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        profileImageUrl: json["profile_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "phone": phone,
        "email_verified": emailVerified,
        "gender": gender,
        "verification_code": verificationCode,
        "package_plan": packagePlan,
        "delete_requested": deleteRequested,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "profile_image_url": profileImageUrl,
      };
}

class User {
  User({
    this.firstName,
    this.lastName,
    this.username,
    this.email,
  });

  final String? firstName;
  final String? lastName;
  final String? username;
  final String? email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "email": email,
      };
}
