import 'package:restaurante_es1/api/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json, jsonDecode;

import 'package:restaurante_es1/model/User.dart';

class UserClient {
  String _urlBase = API.urlBase;
  Map<String, String> _headers = {
    "Content-Type": "application/json",
    "Access-Control_Allow_Origin": "*",
    "Content-Length": "x",
  };

  Future<User> getUser(int id) {
    var map;
    return http
        .get(Uri.parse('$_urlBase/user/$id'), headers: _headers)
        .then((value) {
      map = json.decode(value.body);
      return User.fromMap(map[0]);
    });
  }
}
