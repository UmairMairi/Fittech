import 'dart:convert';

import 'package:fit_tech/data/models/on_boarding_model/login_model.dart';
import 'package:fit_tech/data/network_services/api_services.dart';
import 'package:fit_tech/utils/global_states.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OnboardPostRepository {
  static Future<Map<String, dynamic>?> createAccount(
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

    var response =
        await ApiServices.postJson(url: url, body: data);

    try {
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        showMessage(msg: "your Email already registered", context: context);
      }
    } catch (e) {
      showMessage(msg: "decoding error", context: context);
    }
    return null;
  }

  static Future<Map<String, dynamic>?> verifyAccount(
      {required BuildContext context,
      required String code,
      required String email,
      required String url}) async {
    var data = {
      "code": code,
      'email': email,
    };

    var response =
        await ApiServices.postJson(url: url, body: data);
    try {
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        showMessage(msg: "incorrect verification code", context: context);
      }
    } catch (e) {
      showMessage(msg: "decoding error", context: context);
    }
    return null;
  }

  static Future<LoginModel?> loginJani(
      {required BuildContext context,
      required String email,
      required String password,
      required String url}) async {
    var data = {
      "password": password,
      'email': email,
    };
    var response =
        await ApiServices.postJson(url: url, body: data);
    try {
      if (response.statusCode == 200 &&
          (jsonDecode(response.body)["message"] == "User Login Successfully") &&
          jsonDecode(response.body)["success"] == true) {
        var result = loginModelFromJson(response.body);
        return result;
      } else {
        showMessage(msg: "invalid authentication", context: context);
      }
    } catch (e) {
      showMessage(msg: "decoding error", context: context);
    }
    return null;
  }

  // recovery password screen
  static Future<Map<String, dynamic>?> recoverPasswordDecodeJsonString(
      {required BuildContext context,
      required String email,
      required String url}) async {
    var data = {
      'email': email,
    };
    var response =
        await ApiServices.postJson(url: url, body: data);
    try {
      if (response.statusCode == 200 &&
          (jsonDecode(response.body)["message"] == "email sent successfully") &&
          jsonDecode(response.body)["success"] == true) {
        return jsonDecode(response.body);
      } else {
        showMessage(msg: "email not found", context: context);
      }
    } catch (e) {
      showMessage(msg: "decoding error", context: context);
    }
    return null;
  }

//  forgot password verified code
  static Future<Map<String, dynamic>?>
      forgotPasswordVerifiedCodeDecodeJsonString(
          {required BuildContext context,
          required String code,
          required String email,
          required String url}) async {
    var data = {'email': email, "code": code};
    var response = await ApiServices.postJson(
        url: url, body: data);
    try {
      if (response.statusCode == 200 &&
          (jsonDecode(response.body)["message"] ==
              "email verified successfully") &&
          jsonDecode(response.body)["success"] == true) {
        return jsonDecode(response.body);
      } else {
        showMessage(
            msg: "must be enter correct email and code", context: context);
      }
    } catch (e) {
      showMessage(msg: "decoding error", context: context);
    }
    return null;
  }

//    set new password method

  static Future<Map<String, dynamic>?> newPasswordDecodeJsonString(
      {required BuildContext context,
      required String newPassword,
      required String email,
      required String url}) async {
    var data = {'email': email, "code": newPassword};
    var response =
        await ApiServices.postJson(url: url, body: data);
    try {
      if (response.statusCode == 200 &&
          (jsonDecode(response.body)["message"] ==
              "Password Reset Successfully!") &&
          jsonDecode(response.body)["success"] == true) {
        return jsonDecode(response.body);
      } else {
        showMessage(msg: "${jsonDecode(response.body)["message"]}", context: context);
      }
    } catch (e) {
      showMessage(msg: "decoding error", context: context);
    }
    return null;
  }

  //update profile methode

  static Future<Map<String, dynamic>?> updateProfileDecodeJsonString(
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
      data.putIfAbsent("gender", () => gender);
    } else if (updatePassword != null) {
      data.putIfAbsent("updatePassword", () => updatePassword);
    }

    if (kDebugMode) {
      print("Update Profile Request--> $data");
    }
    var response = await ApiServices.postJson(url: url, body: data,token: GlobalState.token);
    if (kDebugMode) {
      print("Update Profile response--> ${response.body}");
    }
    try {
      if (response.statusCode == 200 &&
          (jsonDecode(response.body)["message"] == "Updated Successfully") &&
          jsonDecode(response.body)["success"] == true) {

        return jsonDecode(response.body);
      } else {
        showMessage(
            msg: "please enter at least one parameter", context: context);
      }
    } catch (e) {
      showMessage(msg: "decoding error", context: context);
    }
    return null;
  }

  // delete account method
  static Future<Map<String, dynamic>?> deleteAccountDecodeJsonString(
      {required BuildContext context,
      String? token,
      required String url}) async {
    var response =
        await ApiServices.postJson(url: url, token: token);
    try {
      if (response.statusCode == 200 &&
          (jsonDecode(response.body)["message"] ==
              "Account Deleted Successfully") &&
          jsonDecode(response.body)["success"] == true) {
        return jsonDecode(response.body);
      } else {
        showMessage(msg: "${jsonDecode(response.body)["message"]} ", context: context);
      }
    } catch (e) {
      showMessage(msg: "decoding error", context: context);
    }
    return null;
  }
}
