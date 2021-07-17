import 'dart:convert';

import 'package:restaurante_es1/api/api.dart';

import 'package:http/http.dart' as http;
import 'package:restaurante_es1/model/Prato.dart';

class PratosClient {
  String _urlBase = API.urlBase;
  Map<String, String> _headers = {
    "Accept": "application/json",
    "Access-Control_Allow_Origin": "*"
  };

  Future<Map<String, dynamic>> getPrato(int id) async {
    late Map<String, dynamic> prato;
    await http
        .get(Uri.parse('$_urlBase/servico/prato/$id'), headers: _headers)
        .then((value) {
      prato = jsonDecode(value.body);
    });
    return prato;
  }

  Future<List<dynamic>> getAllPratos() async {
    return await http
        .get(Uri.parse('$_urlBase/servico/pratos/1'), headers: _headers)
        .then((value) {
      return jsonDecode(value.body);
    });
  }

  Future<List<Prato>> getAllPratosObj() async {
    var myMap;
    List<Prato> pratos = [];
    await http
        .get(Uri.parse('$_urlBase/user/1/favoritos'), headers: _headers)
        .then((value) {
      myMap = json.decode(value.body);
      for (var model in myMap) {
        pratos.add(Prato.fromMap(model));
      }
    });
    return pratos;
  }
}
