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
}
