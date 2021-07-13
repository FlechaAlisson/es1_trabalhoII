import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:restaurante_es1/model/Pedido.dart';

class CartModel extends ChangeNotifier {
  final List<Pedido> _pedidos = [];
  UnmodifiableListView<Pedido> get items => UnmodifiableListView(_pedidos);

  double getTotalValue() {
    double totalValue = 0;

    for (var pedido in _pedidos) {
      totalValue += pedido.valor * pedido.quantidade;
    }
    return totalValue;
  }

  void add(Pedido pedido) {
    var index = _pedidos.indexOf(pedido);
    if (index == -1) {
      _pedidos.add(pedido);
    } else {
      _pedidos[index].quantidade += pedido.quantidade;
    }
    notifyListeners();
  }

  void removeAll() {
    _pedidos.clear();
    notifyListeners();
  }

  void printAll() {
    for (var pedido in _pedidos) {
      print(pedido.toString());
    }
  }
}
