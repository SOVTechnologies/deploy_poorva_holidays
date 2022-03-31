import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiCalling{
  Future<http.Response> postResponse(String url, var body) async {
    var response = await http.post(Uri.parse(url), body: body, headers: headers);
    return response;
  }
  Map<String, String> get headers => {
    "Content-Type": "application/json",
  };

  Future<http.Response> getResponse(String url) async {
    var response = await http.get(Uri.parse(url));
    return response;
  }

}