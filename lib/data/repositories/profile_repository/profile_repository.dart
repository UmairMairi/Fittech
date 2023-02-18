import 'dart:convert';

import 'package:fit_tech/data/models/SuccessResponseGeeneric.dart';
import 'package:fit_tech/data/models/profile_models/my_data_screen_model.dart';
import 'package:fit_tech/data/network_services/api_services.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class ProfilePostRepository {
  static Future<dynamic> uploadImage(
      {required BuildContext context,
      required String filePath,
      required String url}) async {
    var data ={
      "profile_image":filePath
    };
    var response = await ApiServices.postMultiPartJson(
        url: ApiConstants.changeImageProfile, filePath: data);

    if (kDebugMode) {
      print("verify identity Request--> ${response.body}");
    }
    if (response.statusCode == 200) {
      return  successResponseGenericFromJson(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

//  method for change image in response you to get image
  static Future<MyDataScreenModel?>
      getRequestChangeProfileImageDecodeJsonString(
          {required BuildContext context,
          required String url,
          String? token}) async {

    var response = await ApiServices.postJson(url: url, token: token);

    try {
      if (response.statusCode == 200 &&
          jsonDecode(response.body)["success"] == true &&
          jsonDecode(response.body)["data"]["profile_image"] != null) {
        var result = myDataScreenModelFromJson(response.body);
        return result;
        // return jsonDecode(response.body);
      } else {
        showMessage(
            msg: "Invalid token header. No credentials provided",
            context: context);
      }
    } catch (e) {
      showMessage(msg: "decoding error", context: context);
    }
    return null;
  }

//  verify identity
  static Future<dynamic> verifyIdentity(
      {required BuildContext context,
      required String url,
      String? password,
      String? token}) async {
    var data = {"password": password};
    if (kDebugMode) {
      print("verify identity Request--> $data");
    }
    var response = await ApiServices.postJson(
        body: data, url: url, token: token);
    if (kDebugMode) {
      print("verify identity Request--> ${response.body}");
    }
    if (response.statusCode == 200) {
      return  successResponseGenericFromJson(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  static Future<dynamic> updatePassword(
      {required BuildContext context,
      String? oldPassword,
      String? newPassword,
      String? token}) async {
    var data = {"current_password": oldPassword, "new_password": newPassword};
    if (kDebugMode) {
      print("Update password Request--> $data");
    }
    var response = await ApiServices.postJson(
        body: data, url: ApiConstants.changePasswordAfterLogin, token: token);
    if (kDebugMode) {
      print("Update password response--> $response");
    }
    if (response.statusCode == 200) {
      return  successResponseGenericFromJson(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }
}
