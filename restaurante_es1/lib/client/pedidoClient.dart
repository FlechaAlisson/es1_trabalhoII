import 'package:restaurante_es1/api/api.dart';

import 'package:http/http.dart' as http;
import 'package:restaurante_es1/model/Pedido.dart';
import 'dart:convert' show json;

class PedidosClient {
  String _urlBase = API.urlBase;
  Map<String, String> _headers = {
    "Content-Type": "application/json",
    "Access-Control_Allow_Origin": "*",
    "Content-Length": "x",
  };

  Future<void> saveOrder(
      int id, double valueTotal, List<Pedido> pedidos) async {
    var list = [];
    for (var item in pedidos) {
      list.add({"id": item.id, "quantidade": item.quantidade});
    }
    String body = json.encode({"id_cliente": 1, "pratos": list});
    print(body);

    var res = await http.post(
      Uri.parse('$_urlBase/servico/pedido-confirmado'),
      headers: _headers,
      body: body,
    );
    print(res.body);

    return;
  }
}
