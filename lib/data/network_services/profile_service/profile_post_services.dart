import 'dart:convert';

import 'package:http/http.dart' as http;

class ProfilePostServices {
  static Future<http.Response> changeProfileImagePostJson(
      {Map<String, String>? body,
      String? token,
      required String url,
      Map<String, String>? filePath}) async {
    Map<String, String> headers;
    if (token != null) {
      headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
    } else {
      headers = {'Content-Type': 'application/json'};
    }
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields.addAll(body!);
    if (filePath != null) {
      filePath.forEach((key, value) async {
        request.files.add(await http.MultipartFile.fromPath(key, value));
      });
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return await http.Response.fromStream(response);
  }


  //verify identity
  static Future<http.Response> verifyIdentityPostJson(
      {Map<String, dynamic>? body, required String url, String? token}) async {
    Map<String, String> headers;
    if (token != null) {
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
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


  //update password after login
  static Future<http.Response> updatePasswordAfterLoginPostJson(
      {Map<String, dynamic>? body, required String url, String? token}) async {
    Map<String, String> headers;
    if (token != null) {
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
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
}
