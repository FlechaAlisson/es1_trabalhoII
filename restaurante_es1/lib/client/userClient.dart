import 'package:restaurante_es1/api/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json, jsonDecode;

class UserClient {
  String _urlBase = API.urlBase;
  Map<String, String> _headers = {
    "Content-Type": "application/json",
    "Access-Control_Allow_Origin": "*",
    "Content-Length": "x",
  };

  Future<dynamic> getUser(int id) {
    return http
        .get(Uri.parse('$_urlBase/user/$id'), headers: _headers)
        .then((value) => jsonDecode(value.body));
  }
}
