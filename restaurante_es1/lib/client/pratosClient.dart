import 'dart:convert';
import 'dart:ui';

import 'package:restaurante_es1/api/api.dart';

import 'package:http/http.dart' as http;

class PratosClient {
  String _urlBase = API.urlBase;
  Map<String, String> _headers = {
    "Accept": "application/json",
    "Access-Control_Allow_Origin": "*"
  };

  Future<Map<String, dynamic>> getPrato(int id) async {
    late Map<String, dynamic> prato;
    await http
        .get(Uri.parse('${_urlBase}prato/$id'), headers: _headers)
        .then((value) {
      prato = jsonDecode(value.body);
    });
    return prato;
  }

  Future<List<dynamic>> getAllPratos() async {
    late List<dynamic> pratos;
    await http
        .get(Uri.parse('${_urlBase}prato/'), headers: _headers)
        .then((value) {
      pratos = jsonDecode(value.body);
    });
    return pratos;
  }
}
