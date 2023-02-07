import 'dart:convert';

import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/material.dart';

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

    var response = await OnboardPostServices.createAccountPostJson(url: url, body: data);

    try {
      if (response.statusCode == 200 ) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      showMessage(msg: "decoding error", context: context);
    }
    return null;
  }
}
