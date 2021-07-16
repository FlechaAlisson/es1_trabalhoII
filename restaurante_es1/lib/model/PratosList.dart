import 'package:flutter/cupertino.dart';
import 'package:restaurante_es1/client/pratosClient.dart';

import 'Prato.dart';

class PratosList extends ChangeNotifier {
  List<Prato> _pratos = [];

  List<Prato> get pratos => _pratos;
  PratosClient client = PratosClient();

  getAll() async {
    _pratos = await client.getAllPratosObj();

    return _pratos;
  }

  void printAll() {
    for (var prato in _pratos) {
      print(prato.toString());
    }
  }

  void toogleFavorite(int index) {
    _pratos[index].favorito == pratos[index].id
        ? _pratos[index].favorito = 0
        : _pratos[index].favorito = pratos[index].id;

    notifyListeners();
  }
}
