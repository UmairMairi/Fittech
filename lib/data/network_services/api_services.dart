import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiServices {
  static Future<Response> getJson(
      {Map<String, dynamic>? queryParam,
      String? token,
      required String url}) async {
    Map<String, String> headers;

    if (token != null) {
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'token $token'
      };
    } else {
      headers = {
        'Content-Type': 'application/json',
      };
    }
    var request = http.Request('GET', Uri.parse(url));
    request.headers.addAll(headers);
    var streamedResponse = await request.send();
    return await http.Response.fromStream(streamedResponse);
  }

  static Future<Response> postJson(
      {Map<String, dynamic>? body, required String url, String? token}) async {
    Map<String, String> headers;
    if (token != null) {
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'token $token'
      };
    } else {
      headers = {
        'Content-Type': 'application/json',
      };
    }

    var request = http.Request('POST', Uri.parse(url));
    if (body != null) {
      request.body = jsonEncode(body);
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return await http.Response.fromStream(response);
  }

  static Future<Response> postMultiPartJson(
      {String? token,
      Map<String, String>? body,
      Map<String, String>? filePath,
      required String url}) async {
    Map<String, String> headers;
    if (token != null) {
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'token $token',
      };
    } else {
      headers = {'Content-Type': 'application/json'};
    }

    var request = http.MultipartRequest("POST", Uri.parse(url));

    if(body!=null){
      request.fields.addAll(body);
    }
    if (filePath != null) {
      filePath.forEach((key, value) async {
        request.files.add(await http.MultipartFile.fromPath(key, value));
      });
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return await http.Response.fromStream(response);
  }
}
