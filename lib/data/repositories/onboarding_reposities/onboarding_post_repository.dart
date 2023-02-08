import 'dart:convert';

import 'package:fit_tech/data/models/on_boarding_model/login_model.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import '../../network_services/on_boarding_network_services/onboard_post_services.dart';

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
    await OnboardPostServices.createAccountPostJson(url: url, body: data);

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
    await OnboardPostServices.verifyAccountPostJson(url: url, body: data);
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

  static Future<LoginModel?> loginJani({
    required BuildContext context,
    required String email,
    required String password,
    required String url
  })async{

    var data = {
      "password": password,
      'email': email,
    };
    var response =
    await OnboardPostServices.loginPostJson(url: url, body: data);
    try {
      if (response.statusCode == 200 )
      {

       var result =loginModelFromJson(response.body);
       return result;

        return jsonDecode(response.body);
      } else {
        showMessage(msg: "invalid authentication", context: context);
      }
    } catch (e) {
      showMessage(msg: "decoding error", context: context);
    }
    return null;

  }

}
