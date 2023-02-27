import 'dart:convert';

import 'package:fit_tech/data/models/SuccessResponseGeeneric.dart';
import 'package:fit_tech/data/models/UpdateProfileDataModel.dart';
import 'package:fit_tech/data/models/on_boarding_model/login_model.dart';
import 'package:fit_tech/data/network_services/api_services.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/global_states.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../utils/api_constants.dart';
import '../../../utils/pref_utils.dart';
import '../../../utils/singlton.dart';
import '../../models/on_boarding_model/LogoutResponse.dart';
import '../../models/on_boarding_model/SendCodeResponse.dart';

class OnboardPostRepository {
  static Future<dynamic> createAccount(
      {required BuildContext context,
      required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String url}) async {
    var data = {
      "first_name": firstName,
      "last_name": lastName,
      'email': email,
      "password": password
    };

    if (kDebugMode) {
      print("Create Account Request--> $data");
    }
    var response = await ApiServices.postJson(url: url, body: data);
    if (kDebugMode) {
      print("Create Account Response--> ${response.body}");
    }
      if (response.statusCode == 200) {
        return successResponseGenericFromJson(response.body);
      } else {
        return jsonDecode(response.body);
      }
  }

  static Future<dynamic> verifyAccount(
      {required BuildContext context,
      required String code,
      required String email,
      required String url}) async {
    var data = {
      "code": code,
      'email': email,
    };

    if (kDebugMode) {
      print("Verify Email Request--> $data");
    }
    var response = await ApiServices.postJson(url: url, body: data);
    if (kDebugMode) {
      print("Verify Email Response--> ${response.body}");
    }
    if (response.statusCode == 200) {
      return successResponseGenericFromJson(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  static Future<dynamic> login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    var data = {
      "password": password,
      'email': email,
    };
    if (kDebugMode) {
      print("Login Request--> $data");
    }
    var response = await ApiServices.postJson(url: ApiConstants.loginAccount, body: data);
    if (kDebugMode) {
      print("Login Response--> ${response.body}");
    }
      if (response.statusCode == 200) {
        var result = loginModelFromJson(response.body);
        PrefUtils.putString(key: PrefUtils.loginModel, value: response.body ?? "");
        return result;
      } else {
        return jsonDecode(response.body);
      }
  }

  // recovery password screen
  static Future<dynamic> resetPassword(
      {required BuildContext context,
      required String email,
      required String url}) async {
    var data = {
      'email': email,
    };

    if (kDebugMode) {
      print("Reset password Request--> $data");
    }
    var response = await ApiServices.postJson(url: url, body: data);

    if (kDebugMode) {
      print("Reset password Response--> ${response.body}");
    }
    if (response.statusCode == 200) {
      return  successResponseGenericFromJson(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  static Future<dynamic> verifyCode(
          {required BuildContext context,
          required String code,
          required String email,}) async {
    var data = {'email': email, "code": code};
    if (kDebugMode) {
      print("verify code Request--> $data");
    }
    var response = await ApiServices.postJson(url: ApiConstants.forgotPasswordVerifiedCode, body: data);

    if (kDebugMode) {
      print("verify code response--> $response");
    }
    if (response.statusCode == 200) {
      return  successResponseGenericFromJson(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  static Future<dynamic> setNewPassword(
      {required BuildContext context,
      required String newPassword,
      required String email,}) async {
    var data = {'email': email, "new_password": newPassword};
    if (kDebugMode) {
      print("New password Request--> $data");
    }
    var response = await ApiServices.postJson(url: ApiConstants.setNewPassword, body: data);
    if (kDebugMode) {
      print("New password response--> $response");
    }
    if (response.statusCode == 200) {
      return  successResponseGenericFromJson(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  //update profile methode

  static Future<dynamic> updateProfileData(
      {required BuildContext context,
        String? firstName,
        String? lastName,
        String? email,
        String? gender,
        String? updatePassword,
        required String url}) async {
    Map<String, dynamic> data = {};

    if (firstName != null) {
      data.putIfAbsent("first_name", () => firstName);
    } else if (lastName != null) {
      data.putIfAbsent("last_name", () => lastName);
    } else if (email != null) {
      data.putIfAbsent("email", () => email);
    } else if (gender != null) {
      data.putIfAbsent("biological_gender", () => gender);
    } else if (updatePassword != null) {
      data.putIfAbsent("updatePassword", () => updatePassword);
    }

    if (kDebugMode) {
      print("Update Profile Request--> $data");
    }
    var response = await ApiServices.postJson(
        url: url, body: data, token: Singleton.userToken);
    if (kDebugMode) {
      print("Update Profile response--> ${response.body}");
    }
    if (response.statusCode == 200) {
      return  updateProfileModelFromJson(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  // delete account method
  static Future<dynamic> deleteAccount(
      {required BuildContext context,
      String? token,
      }) async {
    var response = await ApiServices.postJson(url: ApiConstants.deleteAccount, token: token);
    if (kDebugMode) {
      print("Delete Account Response--> ${response.body}");
    }
    if (response.statusCode == 200) {
      return  successResponseGenericFromJson(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }



  static Future<dynamic> sendCode({required String email}) async {
    var data = {
      "email": email,
    };
    if (kDebugMode) {
      print("send Code Request--> $data");
    }
    var response = await ApiServices.postJson(body:data,url: ApiConstants.sendCode);
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      var result = sendCodeModelFromJson(response.body ?? "");
      return result;
    } else {
      var result = json.decode(response.body ?? "");
      return result;
    }
  }


  static Future<dynamic> logout() async {

    var response = await ApiServices.postJson(url: ApiConstants.logoutUser,token: Singleton.userToken);
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      var result = successResponseGenericFromJson(response.body);
      return result;
    } else {
      var result = json.decode(response.body);
      return result;
    }
  }
}
