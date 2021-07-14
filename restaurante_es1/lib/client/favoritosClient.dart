import 'package:restaurante_es1/api/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json, jsonDecode;

class FavoritosClient {
  String _urlBase = API.urlBase;
  Map<String, String> _headers = {
    "Content-Type": "application/json",
    "Access-Control_Allow_Origin": "*",
    "Content-Length": "x",
    "Accept": "application/json",
  };

  Future<void> setFavorito(int id) async {
    var body = json.encode({"id_prato": id});
    await http
        .post(Uri.parse('$_urlBase/user/1/favoritos/adiciona'),
            headers: _headers, body: body)
        .then((value) => print(value.body));
  }

  Future<List<dynamic>> getAllPratos() async {
    return await http
        .get(Uri.parse('$_urlBase/user/1/favoritos/lista'), headers: _headers)
        .then((value) {
      return jsonDecode(value.body);
    });
  }
}
