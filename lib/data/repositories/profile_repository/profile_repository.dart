import 'dart:convert';

import 'package:fit_tech/data/models/profile_models/my_data_screen_model.dart';
import 'package:fit_tech/data/network_services/profile_post_service/profile_post_services.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/material.dart';

import '../../network_services/profile_get_services/profile_get_services.dart';

class ProfilePostRepository {
  static Future<Map<String, dynamic>?> changeProfileImageDecodeJsonString(
      {required BuildContext context,
      Map<String, String>? filePath,
      required String url}) async {
    var response = await ProfilePostServices.changeProfileImagePostJson(
        url: url, filePath: filePath);

    try {
      if (response.statusCode == 200 &&
          jsonDecode(response.body)["success"] == true) {
        return jsonDecode(response.body);
      } else {
        showMessage(msg: "Please enter image", context: context);
      }
    } catch (e) {
      showMessage(msg: "decoding error", context: context);
    }
    return null;
  }

//  method for change image in response you to get image
  static Future<MyDataScreenModel?>
      getRequestChangeProfileImageDecodeJsonString(
          {required BuildContext context,
          required String url,
          String? token}) async {
    var response = await ProfileGetServices.changeProfileImageGetRequestJson(
        url: url, token: token);

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
  static Future<Map<String, dynamic>?> verifyIdentityDecodeJsonString(
      {required BuildContext context,
      required String url,
      String? password,
      String? token}) async {
    var data = {"password": password};

    var response = await ProfilePostServices.verifyIdentityPostJson(
        body: data, url: url, token: token);

    try {
      if (response.statusCode == 200 &&
          jsonDecode(response.body)["success"] == true &&
          jsonDecode(response.body)["message"] ==
              "Identity Verified Successfully") {
        return jsonDecode(response.body);

        // return jsonDecode(response.body);
      } else {
        showMessage(
            msg: "Invalid token. No credentials provided", context: context);
      }
    } catch (e) {
      showMessage(msg: "decoding error", context: context);
    }
    return null;
  }

//  update passord after login
  static Future<Map<String, dynamic>?> updatePasswordAfterLoginDecodeJsonString(
      {required BuildContext context,
      required String url,
      String? oldPassword,
      String? newPassword,
      String? token}) async {
    var data = {"current_password": oldPassword, "new_password": newPassword};

    var response = await ProfilePostServices.updatePasswordAfterLoginPostJson(
        body: data, url: url, token: token);

    try {
      if (response.statusCode == 200 &&
          jsonDecode(response.body)["success"] == true &&
          jsonDecode(response.body)["message"] ==
              "password changed Successfully") {
        return jsonDecode(response.body);

        // return jsonDecode(response.body);
      } else {
        showMessage(msg: "password does not match", context: context);
      }
    } catch (e) {
      showMessage(msg: "decoding error", context: context);
    }
    return null;
  }
}
