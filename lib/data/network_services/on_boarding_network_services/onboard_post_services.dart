import 'dart:convert';

import 'package:http/http.dart' as http;

class OnboardPostServices {
  static Future<http.Response> createAccountPostJson(
      {Map<String, dynamic>? body, required String url}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(url));

    if (body != null) {
      request.body = jsonEncode(body);
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return await http.Response.fromStream(response);
  }

//  verify account function
  static Future<http.Response> verifyAccountPostJson(
      {Map<String, dynamic>? body, required String url}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(url));
    if (body != null) {
      request.body = jsonEncode(body);
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return await http.Response.fromStream(response);
  }

//  login User function
  static Future<http.Response> loginPostJson(
      {Map<String, dynamic>? body, required String url}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(url));
    if (body != null) {
      request.body = jsonEncode(body);
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return await http.Response.fromStream(response);
  }

//  recover password method
  static Future<http.Response> recoverPasswordPostJson(
      {Map<String, dynamic>? body, required String url}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(url));
    if (body != null) {
      request.body = jsonEncode(body);
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return await http.Response.fromStream(response);
  }

//  forgot password verified code
  static Future<http.Response> forgotPasswordVerifiedCodePostJson(
      {Map<String, dynamic>? body, required String url}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(url));
    if (body != null) {
      request.body = jsonEncode(body);
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return await http.Response.fromStream(response);
  }

//  set new password method

  static Future<http.Response> newPasswordPostJson(
      {Map<String, dynamic>? body, required String url, String? token}) async {
    Map<String, String> headers;

    if (token != null) {
      headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
    } else {
      headers = {'Content-Type': 'application/json'};
    }
    var request = http.Request('POST', Uri.parse(url));
    if (body != null) {
      request.body = jsonEncode(body);
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return await http.Response.fromStream(response);
  }

//  update profile method
  static Future<http.Response> updateProfilePostJson(
      {Map<String, dynamic>? body, required String url}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(url));
    if (body != null) {
      request.body = jsonEncode(body);
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return await http.Response.fromStream(response);
  }

//  delete account
  static Future<http.Response> deleteAccountPostJson(
      {Map<String, dynamic>? body, required String url, String? token}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(url));
    if (body != null) {
      request.body = jsonEncode(body);
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return await http.Response.fromStream(response);
  }
}
