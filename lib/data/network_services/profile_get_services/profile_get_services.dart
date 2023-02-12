import 'dart:convert';

import 'package:http/http.dart' as http;

class ProfileGetServices {
  static Future<http.Response> changeProfileImageGetRequestJson(
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
    var request = http.Request('GET', Uri.parse(url));
    if (body != null) {
      request.body = jsonEncode(body);
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    // print(await http.Response.fromStream(response));
    return await http.Response.fromStream(response);
  }
}
