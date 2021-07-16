import 'package:flutter/cupertino.dart';

import 'Prato.dart';

class PratosList extends ChangeNotifier {
  final List<Prato> _pratos = [];

  void add(Prato prato) {
    _pratos.add(prato);
  }

  void printAll() {
    for (var prato in _pratos) {
      print(prato.toString());
    }
  }
}
